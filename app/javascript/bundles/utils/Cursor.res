let position = ref(0)
let right_cursor_classname = "right-cursor"
let left_cursor_classname = "left-cursor"

let remove = (textElement: Nullable.t<WebApi.document>) => {
  switch textElement->Nullable.toOption {
  | Some(elements) =>
    let currentCharElement = elements.children[position.contents]
    let nextCharElement = elements.children[position.contents + 1]

    switch [currentCharElement, nextCharElement] {
    | [Some(currentElement), Some(nextCharElement)] =>
      let cursorClass = ref("")
      let element = ref(nextCharElement)

      if currentElement.textContent === " " {
        element := nextCharElement
        cursorClass := left_cursor_classname
      } else {
        element := currentElement
        cursorClass := right_cursor_classname
      }

      position := -1
      element.contents.classList.remove(cursorClass.contents)
    | _ => ()
    }
  | None => ()
  }
}

let add = (cursorIndex: int, textElement: Nullable.t<WebApi.document>) => {
  switch textElement->Nullable.toOption {
  | Some(elements) =>
    let currentCharElement = elements.children[cursorIndex]
    let nextElement = elements.children[cursorIndex + 1]

    switch [currentCharElement, nextElement] {
    | [Some(currentElement), Some(nextElement)] =>
      let cursorClass = ref("")
      let element = ref(nextElement)

      if currentElement.textContent === " " {
        element := nextElement
        cursorClass := left_cursor_classname
      } else {
        element := currentElement
        cursorClass := right_cursor_classname
      }

      position := cursorIndex
      element.contents.classList.add(cursorClass.contents)
    | _ => ()
    }

  | None => ()
  }
}
