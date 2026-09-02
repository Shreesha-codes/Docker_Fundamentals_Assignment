import React from 'react';
import { createRoot } from 'react-dom/client';

const container = document.getElementById('root');
const root = createRoot(container);

root.render(
  <React.StrictMode>
    <h1>Hello World from React.js!</h1>
  </React.StrictMode>
);
