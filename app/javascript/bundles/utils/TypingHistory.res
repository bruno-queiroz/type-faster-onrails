type t = {
  value: string,
  time: int,
  isDeleteContent: bool,
  startPoint: int,
  deletedAmount: int,
  cpm: string,
  accuracy: string,
  isCorrect: bool,
}

let create = () => {
  let typingHistory = ref([])

  let pushToHistory = (data: t, correctLettersTyped: int) => {
    let userGotAtLeastOneLetterRight = correctLettersTyped > 0
    switch userGotAtLeastOneLetterRight {
    | true =>
      let value = switch data.value {
      | "" => "Backspace"
      | value => value
      }

      typingHistory.contents->Array.push({
        ...data,
        value,
        time: WebApi.date().getTime(),
      })
    | false => ()
    }
  }

  let clearTypingHistory = () => {
    typingHistory := []
  }

  (_ => typingHistory.contents, pushToHistory, clearTypingHistory)
}
