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
