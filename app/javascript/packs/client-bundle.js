import ReactOnRails from "react-on-rails";

import { make as App } from "../bundles/App.res.mjs"

// This is how react_on_rails can see the HelloWorld in the browser.
ReactOnRails.register({
  App,
});
