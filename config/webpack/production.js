process.env.NODE_ENV = process.env.NODE_ENV || 'production'

const webpackConfig = require('./base')
webpackConfig.devtool = 'none'

module.exports = webpackConfig
