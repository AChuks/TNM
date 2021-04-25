process.env.NODE_ENV = process.env.NODE_ENV || 'production'

const webpackConfig = require('./base')
webpackConfig.config.merge({
    devtool: 'none'
})

module.exports = webpackConfig
