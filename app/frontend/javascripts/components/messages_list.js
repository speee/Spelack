import React, { Component, PropTypes } from 'react';
import ReactDOM from 'react-dom';
import { VirtualScroll } from 'react-virtualized';
import 'react-virtualized/styles.css'; // only needs to be imported once
import request from 'superagent';
import shallowCompare from 'react-addons-shallow-compare'

export default class MessagesList extends Component {

  constructor (props) {
    super(props)
    this.state = {
      overscanRowsCount: 5,
      rowsCount: 20,
      scrollToIndex: undefined,
      useDynamicRowHeight: false,
      virtualScrollHeight: 300,
      virtualScrollRowHeight: 60,
      list: new Promise(
        (resolve, reject) => {
          request.get("http://localhost:3000/api/messages/index" )
          .end(
            (err, res) => {
              if (err) {
                reject(err);
              } else {
                resolve(JSON.parse(res.text));
              }
            }
          );
        }
      )
    }

    this._getRowHeight = this._getRowHeight.bind(this)
    this._noRowsRenderer = this._noRowsRenderer.bind(this)
    this._onRowsCountChange = this._onRowsCountChange.bind(this)
    this._onScrollToRowChange = this._onScrollToRowChange.bind(this)
    this._rowRenderer = this._rowRenderer.bind(this)
    this._updateUseDynamicRowHeight = this._updateUseDynamicRowHeight.bind(this)
  }

  render () {

    const {
      overscanRowsCount,
      rowsCount,
      scrollToIndex,
      useDynamicRowHeight,
      virtualScrollHeight,
      virtualScrollRowHeight
    } = this.state

    return (
        <div>

            {({ width }) => (
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
                width={width}
              />
            )}

        </div>
    )
  }

  shouldComponentUpdate (nextProps, nextState) {
    return shallowCompare(this, nextProps, nextState)
  }

  _getDatum (index) {
    const { list } = this.state

    return list.get(index % list.size)
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
    console.log('a')
    console.log(datum.text)
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
