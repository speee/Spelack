var path = require('path');
var webpack = require('webpack');

var config = module.exports = {
  context: __dirname,
  entry: './app/frontend/javascripts/entry.js',
};
config.output = {
  path: path.join(__dirname, 'app', 'assets', 'javascripts', 'bundle'),
  filename: 'bundle.js',
  publicPath: '/assets',
};
config.resolve = {
  extensions: ['', '.js','.coffee'],
  modulesDirectories: [ 'node_modules', 'bower_components' ],
};
config.module = {
  loaders: [
    { test: /\.coffee$/, loader: 'coffee-loader' },
  ],
};
