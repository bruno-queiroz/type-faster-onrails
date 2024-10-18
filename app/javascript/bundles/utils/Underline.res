let add = (~inputIndex, ~textArray, ~element: RescriptCore.Nullable.t<WebApi.document>) => {
  let startIndex = ref(inputIndex)
  let text = textArray[startIndex.contents]

  switch (text, element->Nullable.toOption) {
  | (Some(text), Some(element)) =>
    while text !== " " && startIndex.contents < textArray->Array.length {
      let child = element.children[startIndex.contents]

      switch child {
      | Some(child) =>
        child.style.textDecoration = "underline"
        startIndex := startIndex.contents + 1
      | None => startIndex := startIndex.contents + 1
      }
    }

  | _ => ()
  }
}

let remove = (
  ~currentWordBeginningIndex,
  ~textArray,
  ~element: RescriptCore.Nullable.t<WebApi.document>,
) => {
  let startIndex = ref(currentWordBeginningIndex)
  let text = textArray[startIndex.contents]

  switch (text, element->Nullable.toOption) {
  | (Some(text), Some(element)) =>
    while text !== " " && startIndex.contents <= element.children->Array.length - 1 {
      let child = element.children[startIndex.contents]

      switch child {
      | Some(child) =>
        child.style.textDecoration = "none"

        startIndex := startIndex.contents + 1
      | _ => startIndex := startIndex.contents + 1
      }
    }
  | _ => ()
  }
}
