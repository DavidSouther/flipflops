module.exports = (app)->
    require('./config/strategy')(app)
    require('./logout')(app)
