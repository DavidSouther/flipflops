LayoutWatcher = require './watcher'

config = require '../config'

module.exports = (app)->
    debugger
    lw = new LayoutWatcher config
    app.use (q, s, n)->
        if lw.matches q.path
            return lw.handle(q, s, n)
        else
            n()
