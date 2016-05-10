import React, { Component, PropTypes } from 'react';
import ReactDOM from 'react-dom';
import { VirtualScroll } from 'react-virtualized';
import 'react-virtualized/styles.css'; // only needs to be imported once
import request from 'superagent';
import shallowCompare from 'react-addons-shallow-compare'
import { callApi } from '../utils'

export default class Message extends Component {
  static propTypes = {
    //name: PropTypes.string.isRequired,
    text: PropTypes.string.isRequired,
    date: PropTypes.any.isRequired
  }
  constructor (props) {
    super(props)
  }
  render () {
    return (
      <div>
        <p>{this.props.text}</p>
        <p>{this.props.date}</p>
      </div>
      )
  }
}
