@module("/public/guest.png")
external imagePath: string = "default"

@react.component
let make = (~user: Nullable.t<Types.user>) => {
  let image = switch user->Nullable.toOption {
  | Some(user) => user.image
  | None => imagePath
  }

  <header className="flex justify-center p-6 bg-neutral-900 mb-4 rounded-b-lg">
    <div className="flex w-[85%] max-sm:w-full items-center justify-between">
      <a href={"/"} className="text-2xl max-sm:text-lg text-white font-semibold">
        {"TypeFaster"->React.string}
      </a>
      <div className="w-[45px] h-[45px] rounded-full relative">
        <img src={image} alt="user profile picture" className="rounded-full" />
        <UserMenu user>
          <UserMenuHeader user />
        </UserMenu>
      </div>
    </div>
  </header>
}
