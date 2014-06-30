config = require '../config'

st = require 'st'

module.exports = (app)->
    app.use st({ path: "#{config.source}/assets", url: '/assets' })
    app.use st({ path: "#{config.source}/posts", url: '/posts' })
    app.use st({ path: "#{config.source}/pages", url: '/' })
