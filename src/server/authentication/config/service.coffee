Q = require 'q'
pbkdf2 = Q.denodeify(require('crypto').pbkdf2)
winston = require('../../logger').log

users = require('../../config').users or {}

getUser = (username)->
    user = JSON.parse JSON.stringify users[username]
    delete user.hash
    user.username = username
    user

Login = (username, password)->
    winston.debug "Looking up #{username} for login"
    # Generic login rejection.
    invalid = Q.reject "#{username} :: Invalid User"

    unless process.env.CRYPTO_SALT # Should think this through
        return Q.reject "Need CRYPTO_SALT in the environment."

    # The user isn't found at all.
    return invalid unless users[username]?

    # Hash password
    pbkdf2(password, username + process.env.CRYPTO_SALT, 2048, 256)
    .fail (err)->
        winston.debug "Could not run pbkdf2 for #{username}"
        invalid
    .then (hash)->
        hash = hash.toString('base64') # Need the string

        if users[username].hash is hash
            getUser username
        else
            invalid


module.exports = Login
