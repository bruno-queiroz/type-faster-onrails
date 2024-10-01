import React, { useState } from "react";
import { createText } from "../services/api/createText";
// import { ImageResponse, uploadToImgbb } from "@/services/api/uploadToImgbb";

export const useSubmitText = () => {
  const [text, setText] = useState("");
  const [title, setTitle] = useState("");
  const [author, setAuthor] = useState("");
  const [image, setImage] = useState<FileList | string>("");
  const [imageURL, setImageURL] = useState("");

  const handleSubmitText = async (e: React.FormEvent<HTMLFormElement>) => {
    e.preventDefault();

    // let imgbbUrl: ImageResponse | null = null;
    // if (image || imageURL !== "") {
    //   const form = new FormData();
    //   form.append("image", image?.[0] || imageURL);

    //   imgbbUrl = await uploadToImgbb(form);
    // }

    const textData = {
      text: {
        text,
        title,
        author,
        image: "https://i.ibb.co/hXr7TSZ/guest.png",
      },
    };

    const response = await createText(textData);
    if (response.isOk) {
      clearFields();
    }
  };

  const clearFields = () => {
    setTitle("");
    setImageURL("");
    setAuthor("");
    setText("");
    setImage("");
  };

  return {
    setText,
    text,
    setTitle,
    title,
    setAuthor,
    author,
    setImage,
    image,
    setImageURL,
    imageURL,
    handleSubmitText,
  };
};
