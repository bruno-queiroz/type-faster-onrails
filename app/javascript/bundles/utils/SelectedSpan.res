let create = (~bgColor, ~textContent) => {
  let span = WebApi.document.createElement("span")
  span.style.position = "absolute"
  span.style.backgroundColor = bgColor
  span.style.zIndex = "10"
  span.style.left = "0"
  span.textContent = textContent

  span
}
