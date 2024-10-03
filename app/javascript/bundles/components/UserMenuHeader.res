@react.component
let make = (~user: Nullable.t<Types.user>) => {
  let name = switch user->Nullable.toOption {
  | Some(user) => user.name
  | None => "Guest"
  }

  <div className="flex flex-col p-4 pb-0">
    <span className="text-lg font-semibold"> {name->React.string} </span>
    {switch user->Nullable.toOption {
    | Some(user) => <span className="text-sm text-neutral-500"> {user.email->React.string} </span>
    | None => React.null
    }}
  </div>
}
