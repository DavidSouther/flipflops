winston = require('../logger').log

authenticate = (res, user, logout = false)->
    maxAge = if logout then 0 else 900000
    li = if logout then '0' else '1'
    cookieSettings = { maxAge } # secure: true ## soon
    res.cookie 'li', li, cookieSettings
    for f in [ 'username', 'roles' ]
        res.cookie f, user[f], cookieSettings
    winston.info "#{user.username} authenticated and cookies set."
    winston.data res.get('Set-Cookie')

module.exports = {authenticate}
