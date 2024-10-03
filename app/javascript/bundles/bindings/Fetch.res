type t<'data>
type nullableDefaultResponse<'payload> = {
  "msg": Nullable.t<string>,
  "isOk": Nullable.t<bool>,
  "data": Nullable.t<'payload>,
}
type defaultResponse<'payload> = {"msg": string, "isOk": bool, "data": 'payload}

@val @scope("globalThis")
external fetch: (string, 'params) => promise<t<nullableDefaultResponse<'payload>>> = "fetch"

@send external json: t<'data> => promise<'data> = "json"
