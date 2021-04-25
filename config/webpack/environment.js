const {environment} = require('@rails/webpacker')
environment.config.merge({
    devtool: 'none'
})
module.exports = environment