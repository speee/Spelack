import React, { Component, PropTypes } from 'react';
import ReactDOM from 'react-dom';
import '../../stylesheets/message.css';
import request from 'superagent';

var root = 'http://localhost:3000';
export default class Message extends Component {
  static propTypes = {
    //name: PropTypes.string.isRequired,
    text: PropTypes.string.isRequired,
    date: PropTypes.any.isRequired,
    id: PropTypes.any.isRequired
  }
  constructor (props) {
    super(props)

    this.state = {
      hoverd: false
    }
    this.onMouseEnter = this.onMouseEnter.bind(this)
    this.onMouseLeave = this.onMouseLeave.bind(this)
  }
  render () {
    let message_menu
    if (this.state.hoverd){
      message_menu = <span>
            <a href = "#" onClick = {::this.messageUpdate}>Edit</a>
            <a href = "#" onClick = {::this.messageDelete}>Delete</a>
          </span>
    }
    return (
      <div className = 'row'　onMouseEnter={this.onMouseEnter} onMouseLeave = {this.onMouseLeave}>
        <span className = 'name'>{this.props.id}</span>
        <span className = 'date'>{this.props.date}</span>
        <span>{message_menu}</span>
        <div>
          <span className = 'text'>{this.props.text}</span>
        </div>
      </div>
      )
  }

  onMouseEnter () {
    console.log('enter')
    this.setState({hoverd:true});
  }

  onMouseLeave () {
    console.log('leave')
    this.setState({hoverd: false});
  }
  messageUpdate () {
    console.log('update')
  }
  messageDelete () {
  request
  .del(root + '/message')
  .send({id:this.props.id})
  .end(function(err, res){
  });
  }
}
