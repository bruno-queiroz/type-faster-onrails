import React from "react";

interface GameModeCardProps {
  mode: string;
  description: string;
  slug: string;
}

export const GameModeCard = ({
  description,
  mode,
  slug,
}: GameModeCardProps) => {
  return (
    <a
      key={mode}
      href={`/practice?mode=${slug}`}
      className="bg-gray-200 p-4 rounded"
    >
      <h3 className="text-xl font-semibold">{mode}</h3>
      <p>{description}</p>
    </a>
  );
};
