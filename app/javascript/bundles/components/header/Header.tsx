import React from "react";
import { User } from "../../services/api/config";
import { UserMenu } from "./UserMenu";
import { UserMenuHeader } from "./UserMenuHeader";

export const Header = ({user}: {user: User}) => {
  return (
    <header className="flex justify-center p-6 bg-neutral-900 mb-4 rounded-b-lg">
      <div className="flex w-[85%] max-sm:w-full items-center justify-between">
        <a
          href={"/"}
          className="text-2xl max-sm:text-lg text-white font-semibold"
        >
          TypeFaster
        </a>
        <div className="w-[45px] h-[45px] rounded-full relative">
          <img src={user?.image} alt="user profile picture" className="rounded-full" />;
          <UserMenu>
            <UserMenuHeader user={user}/>
          </UserMenu>
        </div>
      </div>
    </header>
  );
};
