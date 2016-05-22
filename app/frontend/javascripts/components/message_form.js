import React, { Component, PropTypes } from 'react';
import ReactDOM from 'react-dom';

export default class MessageForm extends Component {
  static propTypes = {
    onPost: PropTypes.func.isRequired
  }
  constructor (props) {
    super(props)
  }

  render () {
    return (
      <div>
        <input type="text" ref="inputText" />
        <button onClick={::this.sendText}>Send</button>
      </div>
      )
  }

  sendText () {
    this.props.onPost(this.refs.inputText.value)
  }
}
