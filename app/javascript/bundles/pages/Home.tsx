import React from "react";
import { gameModes } from "../content/gameModes";
import { GameModeCard } from "../components/GameModeCard";
import { Title } from "../components/Title";

export const Home = () => {
  return (
    <main className="p-4 w-[85%] max-sm:w-full mx-auto">
      <div className="flex justify-center">
        <div className="flex flex-col items-center">
          <h1>
            <Title>TypeFaster</Title>
          </h1>
          <p>Get better at typing while having fun</p>
        </div>
      </div>

      <div className="flex gap-4 mt-8">
        {gameModes.map((mode) => (
          <GameModeCard {...mode} />
        ))}
      </div>
    </main>
  );
};
