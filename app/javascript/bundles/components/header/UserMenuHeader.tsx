import React from "react";
import { User } from "../../services/api/config";

export const UserMenuHeader = ({user}: {user: User}) => {
  return (
    <div className="flex flex-col p-4 pb-0">
      <span className="text-lg font-semibold">{user?.name}</span>
      <span className="text-sm text-neutral-400">{user?.email}</span>
    </div>
  );
};
