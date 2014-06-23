SiteWatcher = require './watcher'

config = require process.env.CONFIG_FILE or '../../site/config'
config.verbose = yes

module.exports = (app)->
    sw = new SiteWatcher config
    app.use (q, s, n)->
        if sw.matches q.path
            return sw.handle(q, s, n)
        else
            next()
