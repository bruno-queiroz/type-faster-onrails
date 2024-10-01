import { useState } from "react";
import { getTypingHistory } from "./useTyping";
import { clearAllSetIntervals } from "../utils/clearAllSetIntervals";
import { playTypingReview } from "../utils/playTypingReview";

export interface TypingReview {
  value: string;
  cpm: string;
  accuracy: string;
}

export const useTypingReview = () => {
  const [typingReview, setTypingReview] = useState<TypingReview[]>([]);
  const [typingReviewIndex, setTypingReviewIndex] = useState(0);
  const [isPlaying, setIsPlaying] = useState(false);
  const [isCursorShowing, setIsCursorShowing] = useState(false);

  const handlePlayReview = () => {
    const typingHistory = getTypingHistory();

    if (typingHistory.length === typingReviewIndex) return;

    if (!isPlaying) {
      startTypingReview();
    } else {
      pauseTypingReview();
    }

    setIsPlaying((prev) => !prev);
  };

  const reviewFinishedCallBack = () => {
    setIsPlaying(false);
    setIsCursorShowing(false);
  };

  const startTypingReview = () => {
    const typingHistory = getTypingHistory();

    setIsCursorShowing(true);

    playTypingReview({
      typingHistory,
      setTypingReview,
      setTypingReviewIndex,
      typingReviewIndex,
      reviewFinishedCallBack,
    });
  };

  const restartTypingReview = () => {
    const typingHistory = getTypingHistory();

    setTypingReviewIndex(0);
    setTypingReview([]);
    setIsPlaying(true);
    setIsCursorShowing(true);
    clearAllSetIntervals(typingReviewIndex);

    playTypingReview({
      typingHistory,
      setTypingReview,
      setTypingReviewIndex,
      typingReviewIndex: 0,
      reviewFinishedCallBack,
    });
  };

  const pauseTypingReview = () => {
    setIsCursorShowing(false);
    clearAllSetIntervals(typingReviewIndex);
  };

  return {
    restartTypingReview,
    handlePlayReview,
    typingReview,
    isPlaying,
    isCursorShowing,
  };
};
