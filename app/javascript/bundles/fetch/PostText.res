type text = {
  text: string,
  title: string,
  author: string,
  image: option<string>,
}

type t = {text: text}

let post = async (text: t) => {
  let params = {
    "method": "POST",
    "headers": {
      "Content-Type": "application/json",
      "Accept": "application/json",
    },
    "body": JSON.stringifyAny(text),
  }

  let response = await Fetch.fetch("/texts", params)
  let data: Fetch.nullableDefaultResponse<unit> = await Fetch.json(response)

  switch (data["isOk"]->Nullable.toOption, data["msg"]->Nullable.toOption) {
  | (Some(false), Some(errMsg)) => Exn.raiseError(errMsg)
  | (Some(true), _) => ()
  | _ => Exn.raiseError("something went wrong")
  }

  let data = (Obj.magic(data): Fetch.defaultResponse<unit>)
  data
}
