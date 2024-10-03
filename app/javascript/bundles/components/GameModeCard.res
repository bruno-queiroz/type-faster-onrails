@react.component
let make = (~mode: GameMode.t) => {
  <a href={`/practice?mode=${mode.slug}`} className="bg-gray-200 p-4 rounded">
    <h3 className="text-xl font-semibold"> {mode.mode->React.string} </h3>
    <p> {mode.description->React.string} </p>
  </a>
}
