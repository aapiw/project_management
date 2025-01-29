import React from "react";
import ReactDOM from "react-dom/client";

const App = () => {
  return <h1>sa</h1>;
};

// Mount the component to the `#root` div
document.addEventListener("DOMContentLoaded", () => {
  const root = ReactDOM.createRoot(document.getElementById("root"));
  root.render(<App />);
});
