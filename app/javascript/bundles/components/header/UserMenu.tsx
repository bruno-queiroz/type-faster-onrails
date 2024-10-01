import React, { ReactNode, useState } from "react";

export const UserMenu = ({ children }: { children?: ReactNode }) => {
  const [isMenuOpen, setIsMenuOpen] = useState(false);
  //   const { status } = useSession();

  const handleMenu = () => {
    setIsMenuOpen(!isMenuOpen);
  };

  const handleSignOut = () => {
    handleMenu();
    // signOut();
  };
  return (
    <div>
      <div
        className="absolute w-full h-full top-0 cursor-pointer"
        onClick={handleMenu}
      />

      <div
        className="w-[max-content] min-w-[180px] absolute right-0 top-[55px] bg-neutral-800 rounded text-white pb-4"
        style={{ display: isMenuOpen ? "block" : "none" }}
      >
        {children}
        <div className="border-t-[1px] border-t-neutral-500 w-[80%] mx-auto my-4" />
        <ul>
          {"authenticated" === "authenticated" ? (
            <>
              <li className="flex">
                <a
                  href={"/progress"}
                  className="hover:bg-neutral-700 px-4 py-2 w-full text-center"
                  onClick={handleMenu}
                >
                  Progress
                </a>
              </li>
              <li className="flex">
                <button
                  className="hover:bg-neutral-700 px-4 py-2 w-full text-center"
                  onClick={handleSignOut}
                >
                  Sign Out
                </button>
              </li>
            </>
          ) : (
            <>
              <li className="flex">
                <a
                  href={"/sign-up"}
                  className="hover:bg-neutral-700 px-4 py-2 w-full text-center"
                  onClick={handleMenu}
                >
                  Sign up
                </a>
              </li>
            </>
          )}
        </ul>
      </div>
    </div>
  );
};
