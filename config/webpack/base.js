const { webpackConfig } = require('@rails/webpacker')
webpackConfig.devtool = "hidden-source-map";
module.exports = webpackConfig
