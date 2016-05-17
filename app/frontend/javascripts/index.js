import React from 'react';
import ReactDOM from 'react-dom';
import MessagesList from './components/messages_list'
import MessageForm from './components/message_form'
ReactDOM.render(
  <MessagesList />,
  document.getElementById('messages')
);
