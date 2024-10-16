let get = (mistakeAmount: int, inputLength: int) => {
  let mistakePercentage = mistakeAmount * 100 / inputLength
  let accuracyPercentage = 100 - mistakePercentage
  let accuracyFormatted = accuracyPercentage->Int.toFixed(~digits=2)

  accuracyFormatted
}
