winston = require('../../logger').log
passport = require('passport')
LocalStrategy = require('passport-local').Strategy
auth = require('../authenticate')

LoginService = require './service'

strategy =
    callback: (username, password, done)->
        error = (err)-> done(null, false, {message: err})
        found = (user)->done(null, user)
        LoginService(username, password).then(found, error)

passport.use new LocalStrategy strategy.callback

redirects =
    success: '/login/SUCESS'
    failure: '/login/FAIL'

handlers =
    signin: (req, res, next)->
        winston.debug 'Starting local sign in.'
        passport.authenticate('local', (err, user, info)->
            return next err if err
            return res.send(403, info) if user is false
            auth.authenticate res, user
            res.send 204
        )(req, res, next)

route = (app)->
    winston.silly 'Attaching Local handlers to /auth/signin...'
    app.post '/auth/signin/file', handlers.signin
    app.post '/auth/login/file', handlers.signin

module.exports = route
