@react.component
let make = (~user) => {
  <>
    <Header user />
    <ReactRouter.Routes>
      <ReactRouter.Route path="/" element={<Home />} />
      <ReactRouter.Route path="/create-text" element={<CreateText />} />
    </ReactRouter.Routes>
  </>
}
