@react.component
let make = (~children) => {
  <button className="rounded px-4 outline-green-400 bg-[#171717] py-[8px] text-white">
    {children}
  </button>
}
