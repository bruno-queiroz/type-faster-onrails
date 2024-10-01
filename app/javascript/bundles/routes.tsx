import React from "react";

import { Route, Routes } from "react-router-dom";

import { Header } from "./components/header/Header";
import { Home } from "./pages/Home";
import { Practice } from "./pages/Practice";
import { CreateText } from "./pages/CreateText";

export const SpaRoutes = () => (
  <>
    <Header />
    <Routes>
      <Route path="/" element={<Home />} />
      <Route path="/practice" element={<Practice />} />
      <Route path="/create-text" element={<CreateText />} />
    </Routes>
  </>
);
