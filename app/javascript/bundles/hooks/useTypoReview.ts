import { useState } from "react";

import { getTypingHistory, getTypos } from "./useTyping";
import { TypingReview } from "./useTypingReview";

import { clearAllSetIntervals } from "../utils/clearAllSetIntervals";
import { getEndOfWordIndex } from "../utils/getEndOfWordIndex";
import { getStartOfWordIndex } from "../utils/getStartOfWordIndex";
import { playTypingReview } from "../utils/playTypingReview";

export const useTypoReview = () => {
  const [typoReview, setTypoReview] = useState<TypingReview[]>([]);
  const [isCursorShowing, setIsCursorShowing] = useState(false);

  const showTypoReplay = (index: number) => {
    const typos = getTypos();
    const typingHistory = getTypingHistory();

    setTypoReview([]);
    const wordInitialIndex = getStartOfWordIndex(
      typos[index].typingHistoryIndex,
      typingHistory
    );

    const wordFinalIndex = getEndOfWordIndex(
      typos[index].typingHistoryIndex,
      typingHistory
    );

    const replaySlice = typingHistory.slice(wordInitialIndex, wordFinalIndex);

    setIsCursorShowing(true);

    playTypingReview({
      typingHistory: replaySlice,
      reviewFinishedCallBack: () => setIsCursorShowing(false),
      typingReviewIndex: 0,
      setTypingReview: setTypoReview,
    });
  };

  const clearReplay = () => {
    clearAllSetIntervals(0);
  };

  return {
    typoReview,
    isCursorShowing,
    clearReplay,
    showTypoReplay,
  };
};
