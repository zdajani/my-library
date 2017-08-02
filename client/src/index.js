import React from 'react';
import ReactDOM from 'react-dom';
import { Provider } from 'react-redux'

import { store } from './configureStore'

import Welcome from './features/home/components/welcome'


ReactDOM.render(
  <Provider store={store}>
  { /* ConnectedRouter will use the store from Provider automatically */ }
    <Welcome />
  </Provider>, 
  document.getElementById('root')
);


