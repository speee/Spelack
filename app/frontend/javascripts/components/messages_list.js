import React, { Component, PropTypes } from 'react';
import ReactDOM from 'react-dom';
import { VirtualScroll } from 'react-virtualized';
import 'react-virtualized/styles.css'; // only needs to be imported once
import request from 'superagent';
import shallowCompare from 'react-addons-shallow-compare'
import { callApi } from '../utils'

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
    console.debug(this.state.list)
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
    return this._getDatum(index).size
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

    let additionalContent
    return (
      <div>
        {datum.text}
      </div>
    )
  }

  _updateUseDynamicRowHeight (value) {
    this.setState({
      useDynamicRowHeight: value
    })
  }
}
