let check = (
  ~selectionStart,
  ~keyPressed: string,
  ~textArray: array<string>,
  ~currentWordBeginningIndex,
) => {
  let inputIndex = currentWordBeginningIndex + selectionStart - 1
  let text = textArray[inputIndex]

  switch text {
  | Some(text) =>
    if keyPressed === text {
      {
        "isMisspelled": false,
        "index": 0,
      }
    } else {
      {
        "isMisspelled": true,
        "index": inputIndex,
      }
    }
  | None => {
      "isMisspelled": true,
      "index": inputIndex,
    }
  }
}
