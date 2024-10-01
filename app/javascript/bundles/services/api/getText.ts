import { getURLParam } from "../../utils/getURLParam";
import { ServerDefaultResponse, baseApiUrl } from "./config";

export interface Text {
  mode: "traditional" | "repeated-words";
  author: string;
  id: string;
  image: string;
  text: string[];
  title: string;
}

export const getText = async () => {
  try {
    const mode = getURLParam("mode");
    const response = await fetch(`${baseApiUrl}/texts`);
    const data: ServerDefaultResponse<any> = await response.json();

    if (!data?.isOk) {
      throw new Error(data.message);
    }
    console.log("data", data);
    data.data.text = data.data.text.split("");
    return data;
  } catch (err) {
    console.log("Error getting text", err);
    const errorMessage = (err as Error).message;

    throw new Error(errorMessage);
  }
};
