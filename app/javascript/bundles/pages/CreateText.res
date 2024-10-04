@react.component
let make = () => {
  let {
    handleSubmitText,
    setAuthor,
    author,
    setImage,
    image,
    setText,
    text,
    setTitle,
    title,
    setImageURL,
    imageURL,
  } = SubmitText.useSubmitText()

  <section className="flex flex-col items-center p-4">
    <h1>
      <Title> {"Create a new text"->React.string} </Title>
    </h1>
    <form
      className="flex flex-col gap-4 max-w-[400px] w-full"
      onSubmit={e => {
        let _ = handleSubmitText(e)
      }}>
      <label className="flex flex-col gap-1">
        {"Text"->React.string}
        <textarea
          onChange={e => setText(ReactEvent.Form.currentTarget(e)["value"])}
          className="border-[2px] border-neutral-900 rounded p-2"
          rows={5}
          spellCheck=false
          required=true
          value={text}
        />
      </label>
      <Input
        labelText="Title"
        type_="text"
        required=true
        value={title}
        onChange={e => setTitle(ReactEvent.Form.currentTarget(e)["value"])}
      />
      <Input
        labelText="Author"
        type_="text"
        required=true
        value={author}
        onChange={e => setAuthor(ReactEvent.Form.currentTarget(e)["value"])}
      />
      <div className="flex flex-col mt-4">
        <Input
          labelText="Choose image"
          type_="file"
          name="text-image"
          accept="image/*"
          value={image}
          onChange={e => setImage(ReactEvent.Form.currentTarget(e)["value"])}
        />
        <span className="text-center mt-4"> {"OR"->React.string} </span>
        <Input
          labelText="Image URL"
          type_="text"
          value={imageURL}
          onChange={e => setImageURL(ReactEvent.Form.currentTarget(e)["value"])}
        />
      </div>
      <Button> {"Upload"->React.string} </Button>
    </form>
  </section>
}
