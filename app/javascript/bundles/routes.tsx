import React from "react";

import { Route, Routes } from "react-router-dom";

import { Header } from "./components/header/Header";
import { Home } from "./pages/Home";
import { Practice } from "./pages/Practice";
import { CreateText } from "./pages/CreateText";
import { User } from "./services/api/config";

export const SpaRoutes = ({user}: {user: User}) => (
  <>
    <Header user={user}/>
    <Routes>
      <Route path="/" element={<Home />} />
      <Route path="/practice" element={<Practice />} />
      <Route path="/create-text" element={<CreateText />} />
    </Routes>
  </>
);
