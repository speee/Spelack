import React, { Component, PropTypes } from 'react';
import ReactDOM from 'react-dom';
import request from 'superagent';
import MessageList from './components/message_list'
import ChannelList from './components/channel_list'

export default class Application extends Component {
  constructor (props) {
    super(props)

    this.state = {
      selected: 1,
      name: 'general'
    }
  }

  componentDidMount () {
    ReactDOM.render(
      <MessageList
        channel_id = {this.state.selected}
      />,document.getElementById('messages')
    );
    ReactDOM.render(
      <span>#{this.state.name}</span>
      ,document.getElementById('channel_title')
    );
  }

  render () {
    return (
      <div>
        <ChannelList
        setChannel = {::this.setChannel}
        />
        {this.state.message_list}
      </div>
      )
  }

  setChannel (channel_id,name) {
    this.setState({
      selected: channel_id,
      name: name
    })
  }
  componentDidUpdate(nextProps, nextState) {
    if (this.state.selected){
      ReactDOM.render(
        <MessageList
          channel_id = {this.state.selected}
        />,document.getElementById('messages')
      );
      ReactDOM.render(
        <span>#{this.state.name}</span>
        ,document.getElementById('channel_title')
      );
    }
  }
}
