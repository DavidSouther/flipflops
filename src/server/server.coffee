Path = require "path"

# Root is two up from server.
global.root = Path.join __dirname, "..", ".."
app_name = require('../../package').name

logging = require './logger'
winston = logging.log
express = require "express"

app = express()
.use(require('./rewrite/rewriter'))
.use(express.cookieParser())
.use(require('body-parser').json())
.use(logging.middleware)

if process.env.NODE_ENV is 'development'
    winston.info "Starting in development mode"
    app.use express.errorHandler
        dumpExceptions: true
        showStack: true
    app.use (req, res, next)->
        # Let the browser know we can be promiscuous in debug info.
        res.cookie 'NODE_ENV', process.env.NODE_ENV, {maxAge: 900000}
        next()

app
# .use(require('./auth/authenticate').userHandler())
.use(require("./stassets/handler"))
require('./routers')(app)

module.exports =
    server: null
    express: app
    start: (callback)->
        startingPort = process.env.NODE_PORT || 1024
        require('openport')
        .find {startingPort}, (err, port)->
            process.env.PORT = port
            @server = app.listen process.env.PORT
            winston.info "#{app_name} listening"
            winston.info "http://127.0.0.1:#{port}/"
            callback?()

    stop: ->
        @server?.close()
