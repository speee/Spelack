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
        <textarea onKeyDown={::this.getKeyEvent}id="message-input" ref="textArea" className="with-emoji-menu" maxlength="" aria-label="Message input for Private Channel spelack"/>
        <button id="primary_send_button" onClick={::this.sendText}>
          <span className="glyphicon glyphicon-send" aria-hidden="true"></span>
        </button>
      </div>
      )
  }

  sendText () {
    this.props.onPost(this.refs.textArea.value)
    this.refs.textArea.value = ""
  }
  getKeyEvent (e) {
    if (e.keyCode == 13) {
      if(e.shiftKey) {
        return true
      }else{
      this.sendText()
      return false
      }
    }
  }
}
