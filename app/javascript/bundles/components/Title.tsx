import React, { ReactNode } from "react";

interface TitleProps {
  children?: ReactNode;
}

export const Title = ({ children }: TitleProps) => {
  return <span className="mt-4 text-4xl font-bold">{children}</span>;
};
