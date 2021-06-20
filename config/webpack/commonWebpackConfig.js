// Common configuration applying to client and server configuration
const { merge } = require('webpack-merge');
const { webpackConfig: baseClientWebpackConfig } = require('@rails/webpacker')

const commonOptions = {
  resolve: {
      extensions: ['.css', '.ts', '.tsx']
  }
}

// Copy the object using merge b/c the baseClientWebpackConfig and commonOptions are mutable globals
const commonWebpackConfig = () => (merge({}, baseClientWebpackConfig, commonOptions))

module.exports = commonWebpackConfig