import React from 'react';
import ReactDOM from 'react-dom';
import { VirtualScroll } from 'react-virtualized';
import 'react-virtualized/styles.css'; // only needs to be imported once
import { Grid } from 'react-virtualized'

// List data as an array of strings
const list = [
  'messages test'
];

ReactDOM.render(
  <VirtualScroll
    width={300}
    height={300}
    rowsCount={list.length}
    rowHeight={20}
    rowRenderer={
      index => list[index]
    }
  />,
  document.getElementById('messages')
);
