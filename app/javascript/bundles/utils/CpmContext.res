let create = () => {
  let initialDate = WebApi.date().getTime()

  let cb = (inputLength: int) => {
    let currentDate = WebApi.date().getTime()
    let elapsedTime = currentDate - initialDate
    let elapsedTimeInSeconds = elapsedTime / 1000
    let cpm = inputLength * 60 / elapsedTimeInSeconds

    cpm->Int.toString
  }

  cb
}
