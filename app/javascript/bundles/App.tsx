import React from "react";

import { BrowserRouter } from "react-router-dom";
import { SpaRoutes } from "./routes";

import { QueryClient, QueryClientProvider } from "@tanstack/react-query";
import { User } from "./services/api/config";

const queryClient = new QueryClient({
  defaultOptions: {
    queries: {
      refetchOnWindowFocus: false,
    },
  },
});

export const App = ({user}: {user: User}) => {
  return (
    <QueryClientProvider client={queryClient}>
      <BrowserRouter>
        <SpaRoutes user={user}/>
      </BrowserRouter>
    </QueryClientProvider>
  );
};
