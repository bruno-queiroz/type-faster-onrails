@react.component
let make = (~children, ~labelText, ~onClick) => {
  <button
    className="flex justify-center items-center gap-1 py-1 px-4 rounded border-[2px] border-neutral-700 text-neutral-700"
    onClick>
    {children}
    <span> {labelText->React.string} </span>
  </button>
}
