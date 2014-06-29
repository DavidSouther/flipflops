routers = (app)->
    [
        'rewrite'
        'site'
        'static'
    ].forEach (api)->
        require("./#{api}/route")(app)

    app

module.exports = routers
