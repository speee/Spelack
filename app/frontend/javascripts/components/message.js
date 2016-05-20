import React, { Component, PropTypes } from 'react';
import ReactDOM from 'react-dom';
import '../../stylesheets/message.css';
import request from 'superagent';

export default class Message extends Component {
  static propTypes = {
    id: PropTypes.number.isRequired,
    text: PropTypes.string.isRequired,
    date: PropTypes.any.isRequired,
    name: PropTypes.string.isRequired,
    onDelete: PropTypes.func.isRequired,
    onEdit: PropTypes.func.isRequired
  }
  constructor (props) {
    super(props)

    this.state = {
      hovered: false,
      edit: false
    }
    this.getCookie = this.getCookie.bind(this)
  }
  render () {
    let message_menu
    let main_content = <span className = 'text'>{this.props.text}</span>
    if (this.state.hovered && this.getCookie('nickname') == this.props.name){
      message_menu = <span>
            <button type="button" onClick = {::this._onUpdate}>Edit</button>
            <button type="button" onClick = {::this._onDelete}>Delete</button>
          </span>
    }
    if (this.state.edit){
      main_content = <span>
          <textarea ref="textArea" defaultValue={this.props.text} ></textarea>
          <button onClick={::this._onEdit}>change</button>
      </span>
    }
    return (
      <div className = 'row'　onMouseEnter={::this.onMouseEnter} onMouseLeave = {::this.onMouseLeave}>
        <span className = 'name'>{this.props.name}</span>
        <span className = 'date'>{this.props.date}</span>
        <span>{message_menu}</span>
        <div>
          {main_content}
        </div>
      </div>
      )
  }

  onMouseEnter () {
    this.setState({hovered:true});
  }

  onMouseLeave () {
    this.setState({hovered: false});
  }

  _onUpdate () {
    this.setState({edit: true})
  }
  _onDelete () {
  this.props.onDelete(this.props.id)
  }

  _onEdit (e) {
  this.props.onEdit(this.props.id,this.refs.textArea.value)
    this.setState({edit: false})
  }
  getCookie (name) {
    var result = null;
    var cookieName = name + '=';
    var allcookies = document.cookie;

    var position = allcookies.indexOf( cookieName );
    if( position != -1 ){
        var startIndex = position + cookieName.length;

        var endIndex = allcookies.indexOf( ';', startIndex );
        if( endIndex == -1 ){
            endIndex = allcookies.length;
        }
        result = decodeURIComponent(
            allcookies.substring( startIndex, endIndex ) );
    }

    return result;
  }
}
