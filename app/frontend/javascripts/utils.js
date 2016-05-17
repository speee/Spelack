import request from 'superagent';

export function callApi (api) {
  return new Promise(
    (resolve, reject) => {
      request.get("http://localhost:3000/api/"+ api)
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
