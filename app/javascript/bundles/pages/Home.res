@react.component
let make = () => {
  <main className="p-4 w-[85%] max-sm:w-full mx-auto">
    <div className="flex justify-center">
      <div className="flex flex-col items-center">
        <h1>
          <Title> {"TypeFaster"->React.string} </Title>
        </h1>
        <p> {"Get better at typing while having fun"->React.string} </p>
      </div>
    </div>
    <div className="flex gap-4 mt-8">
      {GameMode.modes
      ->Array.map(mode => <GameModeCard mode key=mode.mode />)
      ->React.array}
    </div>
  </main>
}
