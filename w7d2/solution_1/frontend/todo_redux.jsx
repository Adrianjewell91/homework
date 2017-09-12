import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store';

import Root from './components/root';



function applyMiddleWares(store, middlewares) {
  let dispatch = store.dispatch;

  middlewares.forEach((middleware) => {
    dispatch = middleware(store)(dispatch);
  });

  return Object.assign({}, store, {dispatch});
}

document.addEventListener('DOMContentLoaded', () => {
  const preloadedState = localStorage.state ?
    JSON.parse(localStorage.state) : {};
  let store = configureStore(preloadedState);

  // store = applyMiddleWares(store, [addLoggingToDispatch]);
  window.store = store;
  const root = document.getElementById('content');
  ReactDOM.render(<Root store={store} />, root);
});
