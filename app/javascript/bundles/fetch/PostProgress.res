type t = {
  textId: string,
  cpm: string,
  typos: int,
  email: string,
}

let post = async (progress: t) => {
  let params = {
    "method": "POST",
    "headers": {
      "Content-Type": "application/json",
      "Accept": "application/json",
    },
    "body": JSON.stringifyAny(progress),
  }

  let response = await Fetch.fetch("/progress", params)
  let data: Fetch.nullableDefaultResponse<unit> = await Fetch.json(response)

  switch (data["isOk"]->Nullable.toOption, data["msg"]->Nullable.toOption) {
  | (Some(false), Some(errMsg)) => Exn.raiseError(errMsg)
  | (Some(true), _) => ()
  | _ => Exn.raiseError("something went wrong")
  }

  let data = (Obj.magic(data): Fetch.defaultResponse<unit>)
  data
}
