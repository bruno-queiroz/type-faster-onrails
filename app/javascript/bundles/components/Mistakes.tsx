import React from "react";
import { getTypos } from "../hooks/useTyping";
import { MistakeItem } from "./MistakeItem";
import { SubTitle } from "./Subtitle";
import { getText } from "../services/api/getText";

import { useQuery } from "@tanstack/react-query";

export const Mistakes = () => {
  const { data: text } = useQuery({ queryKey: ["text"], queryFn: getText });
  const typos = getTypos();

  if (text?.data.mode === "repeated-words") return "";

  return (
    <article className="relative">
      <SubTitle>Mistakes</SubTitle>

      <div className="bg-gray-100 p-4">
        <div className="flex gap-2 flex-wrap">
          {typos.length === 0
            ? "No mistakes this time! Good Job 🤠"
            : typos.map(({ word }, i) => <MistakeItem {...{ i, word }} />)}
        </div>
      </div>
    </article>
  );
};
