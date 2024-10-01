import { baseApiUrl } from "./config";

interface TypingData {
  textId: string;
  cpm: string;
  typos: number;
  email: string;
}

export const addProgress = async (typingData: TypingData) => {
  const response = await fetch(`${baseApiUrl}/api/progress`, {
    method: "POST",
    headers: {
      "Content-Type": "application/json",
    },
    body: JSON.stringify(typingData),
  });
  const data = await response.json();

  return data;
};
