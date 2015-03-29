var webpack = require("webpack");
var path = require("path");
var bower_dir = __dirname + '/bower_components';
var resolveBowerPath = function(componentPath) {
    return path.join(bower_dir, componentPath);
};
module.exports = {
  entry: './src/app.coffee',
  devtool: "source-map",
  output: {
    path: './build',
    filename: 'geolocale.min.js'
  },
  externals: ['jQuery', 'geoip2'],
  module: {
    noParse: [
      resolveBowerPath('/flux/dist/Flux.js')
    ],
    loaders: [
      { test: /\.coffee$/, loader: "coffee" }
    ]
  },
  plugins: [
    new webpack.optimize.UglifyJsPlugin({minimize: true})
  ],
  resolve: {
    alias: {
      'flux': resolveBowerPath('/flux/dist/Flux.js')
    },
    extensions: ["", ".web.coffee", ".web.js", ".coffee", ".js"]
  }
};
