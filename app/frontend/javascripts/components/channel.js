import React, { Component, PropTypes } from 'react';
import ReactDOM from 'react-dom';
import '../../stylesheets/message.css';

export default class Channel extends Component {
  static propTypes = {
    name: PropTypes.string.isRequired,
    id: PropTypes.number.isRequired,
    _setChannel: PropTypes.func.isRequired
  }
  constructor (props) {
    super(props)
  }

  render () {
    return (
      <div>
        <a href="#" onClick={::this.__setChannel}>{this.props.name}</a>
      </div>
      )
  }

  __setChannel () {
  this.props._setChannel(this.props.id)
  }
}
