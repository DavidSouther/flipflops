SiteWatcher = require './watcher'

config = require '../config'

module.exports = (app)->
    sw = new SiteWatcher config
    app.use (q, s, n)->
        if sw.matches q.path
            return sw.handle(q, s, n)
        else
            n()
