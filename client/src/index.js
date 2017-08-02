import React from 'react';
import ReactDOM from 'react-dom';
import { Provider } from 'react-redux'
import { Route } from 'react-router-dom';
import { ConnectedRouter } from 'react-router-redux'

import { store, history } from './configureStore'

import Welcome from './features/home/components/welcome'
import BooksNew from './features/books/components/books_new'

ReactDOM.render(
  <Provider store={store}>
  { /* ConnectedRouter will use the store from Provider automatically */ }
    <ConnectedRouter history={history}>
      <div>
         <Route exact path="/" component={Welcome}/>
         <Route path="/books/new" component={BooksNew}/>
      </div>
    </ConnectedRouter>
  </Provider>, 
  document.getElementById('root')
);


