import request from 'superagent';
var root = window.location.origin;
export function callApi (api) {
  return new Promise(
    (resolve, reject) => {
      request.get(root+'/api/'+ api)
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
