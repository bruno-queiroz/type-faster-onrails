let get = async () => {
  let params = {
    "method": "GET",
    "headers": {
      "Content-Type": "application/json",
      "Accept": "application/json",
    },
  }

  let response = await Fetch.fetch("/texts", params)
  let data: Fetch.nullableDefaultResponse<Types.text> = await Fetch.json(response)

  switch (data["isOk"]->Nullable.toOption, data["msg"]->Nullable.toOption) {
  | (Some(false), Some(errMsg)) => Exn.raiseError(errMsg)
  | (Some(true), _) => ()
  | _ => Exn.raiseError("something went wrong")
  }

  let data = (Obj.magic(data): Fetch.defaultResponse<Types.text>)
  data
}
