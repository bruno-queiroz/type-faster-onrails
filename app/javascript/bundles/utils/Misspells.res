let update = (~textArray, ~currentText, ~currentWordBeginningIndex) => {
  let updatedMisspells = []
  let isMisspelled = ref(false)

  for i in 0 to currentText->String.length {
    let rightChar = textArray[currentWordBeginningIndex + i]
    let typedChar = currentText->String.charAt(i)

    switch rightChar {
    | Some(rightChar) =>
      if rightChar === typedChar && !isMisspelled.contents {
        ()
      } else {
        updatedMisspells->Array.push({
          "char": typedChar,
          "index": currentWordBeginningIndex + i,
        })
        isMisspelled := true
      }

    | None => ()
    }
  }

  updatedMisspells
}

let getWord = (~currentWordBeginningIndex, ~textArray) => {
  let word = ref("")
  let i = ref(0)
  let char = textArray[currentWordBeginningIndex + i.contents]

  switch char {
  | Some(char) =>
    while char !== " " && currentWordBeginningIndex + i.contents < textArray->Array.length - 1 {
      let currentChar = textArray[currentWordBeginningIndex + i.contents]

      switch currentChar {
      | Some(currentChar) =>
        word := word.contents ++ currentChar
        i := i.contents + 1
      | _ => i := i.contents + 1
      }
    }

  | None => ()
  }

  word.contents
}
