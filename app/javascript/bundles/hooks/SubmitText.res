type t = {
  setText: (string => string) => unit,
  text: string,
  setTitle: (string => string) => unit,
  title: string,
  setAuthor: (string => string) => unit,
  author: string,
  setImage: (string => string) => unit,
  image: string,
  setImageURL: (string => string) => unit,
  imageURL: string,
  handleSubmitText: JsxEventU.Form.t => promise<unit>,
}

let useSubmitText = () => {
  let (text, setText) = React.useState(_ => "")
  let (title, setTitle) = React.useState(_ => "")
  let (author, setAuthor) = React.useState(_ => "")
  let (image, setImage) = React.useState(_ => "")
  let (imageURL, setImageURL) = React.useState(_ => "")

  let clearFields = () => {
    setTitle(_ => "")
    setImageURL(_ => "")
    setAuthor(_ => "")
    setText(_ => "")
    setImage(_ => "")
  }

  let handleSubmitText = async (e: JsxEventU.Form.t) => {
    let e = (Obj.magic(e): WebApi.event)
    e.preventDefault()

    let textData: PostText.t = {
      text: {
        text,
        title,
        author,
        image: Some("https://i.ibb.co/hXr7TSZ/guest.png"),
      },
    }

    let response = await PostText.post(textData)
    if response["isOk"] {
      clearFields()
    }
  }

  {
    setText,
    text,
    setTitle,
    title,
    setAuthor,
    author,
    setImage,
    image,
    setImageURL,
    imageURL,
    handleSubmitText,
  }
}
