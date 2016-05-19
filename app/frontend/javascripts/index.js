import React from 'react';
import ReactDOM from 'react-dom';
import MessagesList from './components/messages_list'
import ChannelsList from './components/channels_list'
import Application from './application'


ReactDOM.render(
  <Application />,
  document.getElementById('channels')
);
