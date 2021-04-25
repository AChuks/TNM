const { webpackConfig } = require('@rails/webpacker')
webpackConfig.devtool = "nosources--source-map";
module.exports = webpackConfig
