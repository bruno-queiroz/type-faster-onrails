import {
  ChangeEvent,
  MouseEvent,
  RefObject,
  useEffect,
  useRef,
  useState,
} from "react";

import { addCursor } from "../utils/addCursor";
import { addUnderlineToTheNewWord } from "../utils/addUnderlineToTheNewWord";
import { removeCursor } from "../utils/removeCursor";
import { removeUnderlineOfThePreviousWord } from "../utils/removeUnderlineOfThePreviousWord";
import { getCPMContext } from "../utils/getCPMContext";
import { getAccuracy } from "../utils/getAccuracy";
import { getTypingElapsedTime } from "../utils/getTypingElapsedTime";
import { getWord } from "../utils/getWord";
import { typosSet } from "../utils/typosSet";
import { clearTextStyles } from "../utils/clearTextStyles";
import { createTypingHistory } from "../utils/createTypingHistory";
import { clearAllSetIntervals } from "../utils/clearAllSetIntervals";
import { getText } from "../services/api/getText";
import { addProgress } from "../services/api/addProgress";
import { paintSelectedBackground } from "../utils/paintSelectedBackground";
import { updateTextColors } from "../utils/updateTextColors";
import { checkInput } from "../utils/checkInput";
import { updateMisspells } from "../utils/updateMisspells";

import { useQuery } from "@tanstack/react-query";

interface NativeEventMissingTypes extends Event {
  inputType: string;
  data: string | null;
}

interface Misspell {
  char: string;
  index: number;
}

export const WRONG_INPUT_COLOR = "rgb(248, 113, 113)";

export const cursorPosition = {
  index: -1,
};
let correctLettersTyped = 0;
export const [getTypingHistory, pushToHistory, clearTypingHistory] =
  createTypingHistory();
export const [getTypos, addTypo, clearTypos] = typosSet();

export const useTyping = (
  getTextElement: () => RefObject<HTMLParagraphElement>,
  getInputElement: () => RefObject<HTMLInputElement>
) => {
  const [input, setInput] = useState("");
  const [inputIndex, setInputIndex] = useState(0);
  const [currentWordBeginningIndex, setCurrentWordBeginningIndex] = useState(0);
  const [misspells, setMisspells] = useState<Misspell[]>([]);
  const [isTypingFinished, setIsTypingFinished] = useState(false);
  const [consecutiveMistakesModal, setConsecutiveMistakesModal] = useState({
    isOpen: false,
    word: "",
  });
  const [isSignUpModalOpen, setIsSignUpModalOpen] = useState(false);
  const [accuracy, setAccuracy] = useState("0");
  const [time, setTime] = useState("0");
  const [cpm, setCpm] = useState("0");
  const [mistakeCount, setMistakeCount] = useState(0);

  const intervalId = useRef<NodeJS.Timer>();

  const { data, refetch, isFetching } = useQuery({
    queryKey: ["text"],
    queryFn: getText,
  });

  useEffect(() => {
    restartTyping();
  }, [data]);

  useEffect(() => {
    const clearTimeoutsAndIntervals = () => {
      clearInterval(intervalId.current);
      clearAllSetIntervals(0);

      resetTypingHistory();
      resetTypingStates();
    };

    return clearTimeoutsAndIntervals;
  }, []);

  const onType = (e: ChangeEvent<HTMLInputElement>) => {
    const textElement = getTextElement();
    const textArray = data?.data?.text || [];

    if (!textElement.current) return;
    if (isFetching) return e.preventDefault();

    const nativeEvent = e.nativeEvent as NativeEventMissingTypes;
    const isDeleteContentBackward =
      nativeEvent.inputType === "deleteContentBackward";
    const isDeleteWordBackward = nativeEvent.inputType === "deleteWordBackward";
    const keyPressed = nativeEvent.data || "";

    const currentText = e.target.value;
    const selectionStart = e.target.selectionStart || 0;
    const cursorIndex = selectionStart + currentWordBeginningIndex - 1;

    const textElementChildren = textElement.current?.children;

    removeCursor(textElementChildren);
    addCursor(cursorIndex, textElementChildren);

    const isDeleting = isDeleteContentBackward || isDeleteWordBackward;

    let isInputCorrect = true;
    if (!consecutiveMistakesModal.isOpen || isDeleting) {
      setInput(e.target.value);

      updateTextColors({
        currentWordBeginningIndex,
        elements: textElementChildren,
        inputValue: currentText,
        rightInputColor: "green",
        wrongInputColor: WRONG_INPUT_COLOR,
      });

      setTimeout(() => {
        pushToHistory(
          {
            value: keyPressed,
            isDeleteContent: isDeleting,
            startPoint: currentText.length - selectionStart,
            deletedAmount: input.length - currentText.length,
            cpm,
            accuracy: getAccuracy(mistakeCount, correctLettersTyped),
            isCorrect: isInputCorrect,
          },
          correctLettersTyped
        );
      }, 0);
    }

    if (isDeleting) {
      const updatedMisspells = updateMisspells({
        textArray,
        currentText,
        currentWordBeginningIndex,
      });
      setMisspells(updatedMisspells);

      const amountOfCharsDeleted =
        inputIndex - (currentWordBeginningIndex + currentText.length);

      if (consecutiveMistakesModal.isOpen && updatedMisspells.length === 0) {
        setConsecutiveMistakesModal({
          isOpen: false,
          word: "",
        });
      }
      setInputIndex(inputIndex - amountOfCharsDeleted);
      return;
    }

    if (misspells.length > 7) {
      setConsecutiveMistakesModal({
        isOpen: true,
        word: getWord(currentWordBeginningIndex, textArray),
      });
      return;
    }

    if (consecutiveMistakesModal.isOpen) return;

    setInputIndex(inputIndex + 1);
    const inputData = checkInput({
      selectionStart,
      currentWordBeginningIndex,
      keyPressed,
      textArray,
    });

    if (inputData.isMisspelled) {
      setMistakeCount(mistakeCount + 1);
      setMisspells([...misspells, { char: keyPressed, index: inputIndex }]);

      const typingHistory = getTypingHistory();
      addTypo({
        word: getWord(currentWordBeginningIndex, textArray),
        typingHistoryIndex: typingHistory.length,
      });
      isInputCorrect = false;
      return;
    }

    const isThereNoMisspells = misspells.length === 0;
    if (isThereNoMisspells && inputIndex + 1 > correctLettersTyped) {
      correctLettersTyped++;
    }

    const isFirstInput = correctLettersTyped === 1;
    if (isFirstInput) {
      setMistakeCount(0);
      clearTypos();

      const getCPM = getCPMContext();

      intervalId.current = setInterval(() => {
        const newCpm = getCPM(correctLettersTyped);
        setCpm(newCpm);
      }, 2000);
    }

    if (keyPressed === " " && isThereNoMisspells) {
      addUnderlineToTheNewWord(inputIndex + 1, textArray, textElementChildren);
      removeUnderlineOfThePreviousWord(
        currentWordBeginningIndex,
        textArray,
        textElementChildren
      );

      setInput("");
      setCurrentWordBeginningIndex(inputIndex + 1);
    }

    if (isThereNoMisspells && correctLettersTyped === textArray.length) {
      endMatch();
    }
  };

  const endMatch = async () => {
    const typingHistory = getTypingHistory();

    clearInterval(intervalId.current);
    setIsTypingFinished(true);

    const typeAccuracy = getAccuracy(mistakeCount, correctLettersTyped);
    const typedTime = getTypingElapsedTime(typingHistory[0].time);

    setAccuracy(typeAccuracy);
    setTime(typedTime);

    if (!data?.data?.id) return;

    if ("unauthenticated" === "unauthenticated") {
      setIsSignUpModalOpen(true);
      return;
    }

    if (data.data.mode === "repeated-words") return;

    const typingData = {
      textId: data?.data.id,
      cpm,
      typos: mistakeCount,
      email: "",
    };

    await addProgress(typingData);
  };

  const closeConsecutiveMistakesModal = () => {
    setConsecutiveMistakesModal({
      isOpen: false,
      word: "",
    });
  };

  const resetTypingStates = () => {
    setCurrentWordBeginningIndex(0);
    setMisspells([]);
    setIsTypingFinished(false);
    setInputIndex(0);
    setInput("");

    setCpm("0");
    setAccuracy("0");
    setTime("0");
    setMistakeCount(0);
  };

  const resetTypingHistory = () => {
    clearTypingHistory();
    clearTypos();
    correctLettersTyped = 0;
  };

  const restartTyping = () => {
    const textElement = getTextElement();
    const textArray = data?.data?.text || [];

    if (!textElement.current) return;
    const elements = textElement.current.children;

    removeCursor(elements);

    resetTypingHistory();
    resetTypingStates();

    clearTextStyles(elements, "black", "#E5E7EB");

    removeUnderlineOfThePreviousWord(
      currentWordBeginningIndex,
      textArray,
      elements
    );

    setTimeout(() => {
      const inputElement = getInputElement();
      inputElement.current?.focus();
    }, 10);
  };

  const showSelectedText = (
    e: MouseEvent<HTMLInputElement, globalThis.MouseEvent>
  ) => {
    const textElement = getTextElement();
    const inputElement = getInputElement();

    if (!textElement.current) return;
    if (!inputElement.current) return;
    if (!data?.data?.text) return;
    if (isFetching) return e.preventDefault();

    const selectionStart = (e.target as HTMLInputElement).selectionStart || 0;
    const selectionEnd = (e.target as HTMLInputElement).selectionEnd || 0;

    const textElementChildren = textElement.current?.children;

    paintSelectedBackground(
      textElementChildren,
      currentWordBeginningIndex,
      inputElement.current,
      selectionStart,
      selectionEnd,
      "white"
    );
  };

  const getNewText = () => {
    restartTyping();
    clearAllSetIntervals(0);
    refetch();
  };

  return {
    input,
    isTypingFinished,
    cpm,
    accuracy,
    time,
    consecutiveMistakesModal,
    misspells,
    inputIndex,
    currentWordBeginningIndex,
    isSignUpModalOpen,
    setIsSignUpModalOpen,
    closeConsecutiveMistakesModal,
    onType,
    getNewText,
    showSelectedText,
    restartTyping,
  };
};
