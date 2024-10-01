import React from "react";

import { BrowserRouter } from "react-router-dom";
import { SpaRoutes } from "./routes";

import { QueryClient, QueryClientProvider } from "@tanstack/react-query";

const queryClient = new QueryClient({
  defaultOptions: {
    queries: {
      refetchOnWindowFocus: false,
    },
  },
});

export const App = () => {
  return (
    <QueryClientProvider client={queryClient}>
      <BrowserRouter>
        <SpaRoutes />
      </BrowserRouter>
    </QueryClientProvider>
  );
};
