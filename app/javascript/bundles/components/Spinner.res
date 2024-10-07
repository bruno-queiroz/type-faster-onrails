@react.component
let make = (~color="neutral-900") => {
  <div
    className={`w-[24px] h-[24px] border-[5px] border-${color} mx-auto border-t-[5px] border-t-transparent rounded-full animate-spin`}
  />
}
