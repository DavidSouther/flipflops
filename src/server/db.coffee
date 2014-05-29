winston = require('./logger').log
mongoose = require('mongoose-q')(require('mongoose'), {spread: true})
mongod = "mongodb://localhost:#{process.env.MONGO_PORT || 27017}/scavenge"
mongoose.connect mongod

mongoose.connection.on 'error', (err)->
    winston.error 'connection error:', err
    console.log err
    console.log arguments

module.exports = mongoose
