import React, { Component, PropTypes } from 'react';
import ReactDOM from 'react-dom';
import request from 'superagent';
import MessagesList from './components/messages_list'
import ChannelsList from './components/channels_list'

var root = 'http://localhost:3000';
export default class Application extends Component {
  constructor (props) {
    super(props)

    this.state = {
      selected: undefined
    }
  }
  render () {
    return (
      <div>
        <ChannelsList
        setChannel = {::this.setChannel}
        />
        {this.state.message_list}
      </div>
      )
  }

  setChannel (channel_id) {
    console.log(channel_id)
    this.setState({
      selected: channel_id
    })
  }
  componentDidUpdate(nextProps, nextState) {
    if (this.state.selected){
        ReactDOM.render(
          <MessagesList
        channel_id = {this.state.selected}
      />,document.getElementById('messages')
      );
    }

  }
}
