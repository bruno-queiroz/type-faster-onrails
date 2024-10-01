import { TypingHistory } from "./createTypingHistory";
import { TypingReview } from "../hooks/useTypingReview";
import { Dispatch, SetStateAction } from "react";

export const playTypingReview = ({
  typingHistory,
  setTypingReview,
  setTypingReviewIndex,
  typingReviewIndex,
  reviewFinishedCallBack,
}: {
  typingHistory: TypingHistory[];
  setTypingReview: Dispatch<SetStateAction<TypingReview[]>>;
  typingReviewIndex: number;
  setTypingReviewIndex?: Dispatch<SetStateAction<number>>;
  reviewFinishedCallBack: () => void;
}) => {
  let initialDate = typingHistory[0].time;

  if (typingReviewIndex > 0) {
    initialDate = typingHistory[typingReviewIndex].time;
  }

  for (let i = typingReviewIndex; i < typingHistory.length; i++) {
    const type = typingHistory[i];

    const typingReview = {
      value: type.value,
      accuracy: type.accuracy,
      cpm: type.cpm,
    };

    setTimeout(() => {
      setTypingReviewIndex?.((prev) => prev + 1);

      const isLastReviewItem = i === typingHistory.length - 1;
      if (isLastReviewItem) {
        reviewFinishedCallBack();
      }

      if (type.isDeleteContent) {
        setTypingReview((prev) => {
          const updatedHistory = [...prev];
          updatedHistory.splice(
            (type.startPoint + type.deletedAmount) * -1,
            type.deletedAmount
          );

          return updatedHistory;
        });
      } else {
        if (type.startPoint > 0) {
          setTypingReview((prev) => {
            const updatedHistory = [...prev];
            updatedHistory.splice(type.startPoint * -1, 0, typingReview);

            return updatedHistory;
          });
          return;
        }

        setTypingReview((prev) => [...prev, typingReview]);
      }
    }, type.time - initialDate);
  }
};
