import React from "react";

export const TypedProgressBar = ({ progress }: { progress: number }) => {
  return (
    <div className="h-4 w-full bg-white rounded-full">
      <div
        className="h-full bg-green-500 rounded-full"
        style={{ width: `${progress}%` }}
      />
    </div>
  );
};
