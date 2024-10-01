import { ServerDefaultResponse, baseApiUrl } from "./config";

interface Text {
  text: {
    text: string;
    title: string;
    author: string;
    image: string | null;
  };
}

export const createText = async (text: Text) => {
  const response = await fetch(`${baseApiUrl}/texts`, {
    method: "POST",
    headers: {
      "Content-Type": "application/json",
    },
    body: JSON.stringify(text),
  });

  const data: ServerDefaultResponse<Text> = await response.json();

  return data;
};
