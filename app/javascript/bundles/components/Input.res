@react.component
let make = React.forwardRef((
  ~labelText: string,
  ~autoFocus: option<bool>=?,
  ~type_: option<string>=?,
  ~required=false,
  ~value: string,
  ~onChange: ReactEvent.Form.t => unit,
  ~name: option<string>=?,
  ~accept: option<string>=?,
  ref,
) => {
  <label className="flex flex-col gap-1">
    <span className="font-medium"> {labelText->React.string} </span>
    <input
      ref=?{Nullable.toOption(ref)->Option.map(ReactDOM.Ref.domRef)}
      required
      value
      onChange
      ?autoFocus
      ?type_
      ?name
      ?accept
      className="border-[2px] border-neutral-900 rounded p-2"
    />
  </label>
})
