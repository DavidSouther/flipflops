winston = require('../logger').log
auth = require('./authenticate')

signout = (req, res, next)->
    username = req.cookies.username
    winston.info "#{username} signing out..."

    # TODO Logout
    auth.authenticate res, {name: '',  username: '', token: ''}, true

route = (app)->
    app.get '/auth/signout', signout
    app.get '/auth/logout', signout

module.exports = route
