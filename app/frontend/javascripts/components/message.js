import React, { Component, PropTypes } from 'react';
import ReactDOM from 'react-dom';
// import '../../stylesheets/message.css';
import request from 'superagent';

export default class Message extends Component {
  static propTypes = {
    id: PropTypes.number.isRequired,
    text: PropTypes.string.isRequired,
    date: PropTypes.any.isRequired,
    name: PropTypes.string.isRequired,
    onDelete: PropTypes.func.isRequired,
    onEdit: PropTypes.func.isRequired,
    onUpdate: PropTypes.func.isRequired,
    onCancel: PropTypes.func.isRequired
  }
  constructor (props) {
    super(props)

    this.state = {
      hovered: false,
      edit: false
    }
  }
  render () {
    let date = new Date(this.props.date)
    let date_text = date.getFullYear() + '年' + (date.getMonth()+1) + '月' + date.getDate() + '日' + date.getHours() + ':' +   date.getMinutes()
    let message_menu
    let main_content = <span className = 'text'>{this.props.text}</span>
    if (this.state.hovered && (window.nickname == this.props.name)){
      message_menu = <span>
            <button className="message_edit_button ml_1x" type="button" onClick = {::this._onUpdate}>
              <span className="glyphicon glyphicon-pencil" aria-hidden="true"></span>
            </button>
            <button className="message_delete_button" type="button" onClick = {::this._onDelete}>
              <span className="glyphicon glyphicon-trash" aria-hidden="true"></span>
            </button>
          </span>
    }
    if (this.state.edit){
      main_content = <span>
          <textarea className = "message_edit_form"  ref="textArea" defaultValue={this.props.text} ></textarea>
          <button className="message_edit_cancel_button" onClick={::this._onCancel}>Cancel</button>
          <button className="message_edit_save_changes_button" onClick={::this._onEdit}>Save Changes</button>
      </span>
    }
    return (
      <div className = 'ts-message' onMouseEnter={::this.onMouseEnter} onMouseLeave = {::this.onMouseLeave}>
        <div className='message_gutter'>
            <div className='message_icon'>
            </div>
          </div>
        <div className = 'message_content'>
          <div className="message_header">
            <span className = 'nickname'>{this.props.name}</span>
            <span className = 'transmission_time'>{date_text}</span>
          </div>
          <div className = 'message_body'>
            {main_content}
          </div>

        </div>
        <span className = 'message_menu_button'>{message_menu}</span>
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
    this.props.onUpdate(this.props.id)
  }
  _onDelete () {
    this.props.onDelete(this.props.id)
    if(this.state.edit){
      this.setState({edit: false})
    }
  }

  _onEdit (e) {
  this.props.onEdit(this.props.id,this.refs.textArea.value)
    this.setState({edit: false})
  }

  _onCancel () {
    this.setState({
      edit:false
    })
    this.props.onCancel()
  }
}
