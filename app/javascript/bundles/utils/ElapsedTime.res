let get = (firstInput: option<TypingHistory.t>) => {
  switch firstInput {
  | Some(firstInput) =>
    let initialDate = firstInput.time
    let now = WebApi.date().getTime()

    let elapsedTime = now - initialDate

    let elapsedTimeInMinutes = elapsedTime / 1000 / 60
    let elapsedTimeInSeconds = (elapsedTime / 1000)->Int.mod(60)

    let formattedTime = ref("")

    let [minutes] = elapsedTimeInMinutes->Int.toString->String.split(".")
    let [seconds] = elapsedTimeInSeconds->Int.toString->String.split(".")

    formattedTime := `${minutes}.`

    let secondsInt = seconds->Int.fromString
    switch secondsInt {
    | Some(seconds) =>
      if seconds < 10 {
        formattedTime.contents = formattedTime.contents ++ "0"
      }
    | None => ()
    }

    formattedTime.contents = formattedTime.contents ++ seconds

    formattedTime.contents
  | None => ""
  }
}
