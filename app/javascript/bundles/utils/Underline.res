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
        startIndex.contents = startIndex.contents + 1
      | None => startIndex.contents = startIndex.contents + 1
      }
    }

  | _ => ()
  }
}
