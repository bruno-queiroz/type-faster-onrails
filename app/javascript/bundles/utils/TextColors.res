let wrong_input_color = "rgb(248, 113, 113)"

let update = (
  ~inputValue: string,
  ~element: Nullable.t<WebApi.document>,
  ~currentWordBeginningIndex,
  ~rightInputColor,
) => {
  switch element->Nullable.toOption {
  | Some(element) =>
    let isIncorrect = ref(false)
    for i in 0 to element.children->Array.length - currentWordBeginningIndex {
      let element = element.children[currentWordBeginningIndex + i]

      switch element {
      | Some(element) =>
        let elementValue = element.textContent
        let typedLetter = inputValue->String.charAt(i)

        if i > inputValue->String.length - 1 {
          element.style.color = "black"
          element.style.backgroundColor = "transparent"
        } else if elementValue === typedLetter && !isIncorrect.contents {
          element.style.color = rightInputColor
          element.style.backgroundColor = "transparent"
        } else {
          isIncorrect := true
          element.style.color = "black"
          element.style.backgroundColor = wrong_input_color
        }

      | None => ()
      }
    }
  | _ => ()
  }
}
