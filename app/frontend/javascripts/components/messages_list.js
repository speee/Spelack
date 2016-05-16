import React, { Component, PropTypes } from 'react';
import ReactDOM from 'react-dom';
import { VirtualScroll } from 'react-virtualized';
import 'react-virtualized/styles.css'; // only needs to be imported once
import request from 'superagent';
import shallowCompare from 'react-addons-shallow-compare'
import { callApi } from '../utils'
import Message from './message'

var root = 'http://localhost:3000';

export default class MessagesList extends Component {

  constructor (props) {
    super(props)
    this.state = {
      overscanRowsCount: 5,
      rowsCount: 0,
      scrollToIndex: undefined,
      useDynamicRowHeight: false,
      virtualScrollHeight: 300,
      virtualScrollRowHeight: 60,
      list: []
    }
    this.deleteMessage = this.deleteMessage.bind(this)
    this.componentDidMount = this.componentDidMount.bind(this)
    this._getRowHeight = this._getRowHeight.bind(this)
    this._noRowsRenderer = this._noRowsRenderer.bind(this)
    this._onRowsCountChange = this._onRowsCountChange.bind(this)
    this._onScrollToRowChange = this._onScrollToRowChange.bind(this)
    this._rowRenderer = this._rowRenderer.bind(this)
    this._updateUseDynamicRowHeight = this._updateUseDynamicRowHeight.bind(this)
  }
  componentDidMount () {
    console.log('didmount')
    callApi('messages/index')
    .then(
      (obj) => {
        this.setState({ list:obj,
          rowsCount:obj.length
        })
      }
    ).catch(
      (err) => { console.error(err); }
    );
    this.setupSubscription()
  }
  setupSubscription() {
    App.cable.subscriptions.create('MessagesChannel', {
      received(message) {
        return this.updateMessage(message)
      },
      updateMessage: this.updateMessage.bind(this)
    })
  }

  updateMessage(message) {
    console.log(message)
    this.setState({
      list: this.state.list.concat(JSON.parse(message)),
      rowsCount: this.state.rowsCount + 1,
      scrollToIndex: this.state.rowsCount
    })
  }

  render () {
    const {
      overscanRowsCount,
      rowsCount,
      scrollToIndex,
      useDynamicRowHeight,
      virtualScrollHeight,
      virtualScrollRowHeight,
      list
    } = this.state
    //console.log(this.state.list)
    return (
        <div>

              <VirtualScroll
                ref='VirtualScroll'
                className='VirtualScroll'
                height={virtualScrollHeight}
                overscanRowsCount={overscanRowsCount}
                noRowsRenderer={this._noRowsRenderer}
                rowsCount={rowsCount}
                rowHeight={useDynamicRowHeight ? this._getRowHeight : virtualScrollRowHeight}
                rowRenderer={this._rowRenderer}
                scrollToIndex={scrollToIndex}
                width={600}
              />

        </div>
    )
  }

  shouldComponentUpdate (nextProps, nextState) {
    return shallowCompare(this, nextProps, nextState)
  }

  _getDatum (index) {
    const list = this.state.list
    return list[(index % list.length)]
  }

  _getRowHeight (index) {
    return this._getDatum(index).length
  }

  _noRowsRenderer () {
    return (
      <div className='No_rows'>
        No rows
      </div>
    )
  }

  _onRowsCountChange (event) {
    const rowsCount = parseInt(event.target.value, 10) || 0

    this.setState({ rowsCount })
  }

  _onScrollToRowChange (event) {
    const { rowsCount } = this.state
    let scrollToIndex = Math.min(rowsCount - 1, parseInt(event.target.value, 10))

    if (isNaN(scrollToIndex)) {
      scrollToIndex = undefined
    }

    this.setState({ scrollToIndex })
  }

  _rowRenderer (index) {
    const { useDynamicRowHeight } = this.state
    let datum = this._getDatum(index)

    return (
      <Message
      text = {datum.text}
      date = {datum.created_at}
      id = {datum.id}
      onDelete = {this.deleteMessage}
      />
    )
  }

  _updateUseDynamicRowHeight (value) {
    this.setState({
      useDynamicRowHeight: value
    })
  }

  deleteMessage (id) {
    console.log('id = '+ id)
    var hoge =
    console.log(hoge)
    this.setState({
      list: this.state.list.filter((message) => {
        console.log(message.id !== id)
        return message.id !== id;
      }),
      rowsCount: this.state.list.length-1,
      scrollToIndex: undefined
    }, function(){
      console.log(this.state.list)
    });

  request
  .del(root + '/messages/' + id)
  .end(function(err, res){
  });

  }
}
