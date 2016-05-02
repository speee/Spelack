import React from 'react';
import ReactDOM from 'react-dom';
import { VirtualScroll } from 'react-virtualized';
import 'react-virtualized/styles.css'; // only needs to be imported once
import { Grid } from 'react-virtualized';
import request from 'superagent';

function callApi(apiName) {
  return new Promise(
    (resolve, reject) => {
      request.get("http://localhost:3000/" + apiName)
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
  );
}

var chat_messages = callApi('api/messages/index')
  .then(
    (obj) => {
      console.debug(obj);
    }
  ).catch(
    (err) => {console.error(err);}
  );
// List data as an array of strings
const list = [
  chat_messages
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
