type t<'a> = {
  add: 'a => unit,
  delete: 'a => bool,
  forEach: ('a => unit) => unit,
  has: 'a => bool,
  clear: unit => unit,
  size: unit => int,
}
@new external makeSet: unit => t<'a> = "Set"
@send external add: 'a => unit = "add"
@send external has: 'a => bool = "has"
@send external delete: 'a => unit = "delete"
@send external clear: unit => unit = "clear"
@send external size: unit => int = "size"
@send external forEach: (t<'a>, 'a => unit) => unit = "forEach"
