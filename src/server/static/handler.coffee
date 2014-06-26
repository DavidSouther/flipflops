config = require process.env.CONFIG_FILE or '../../site/config'

st = require 'st'

module.exports = (app)->
    app.use st({ path: "#{config.source}/assets", url: '/assets' })
    app.use st({ path: "#{config.source}/pages", url: '/' })
