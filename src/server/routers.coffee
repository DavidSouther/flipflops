routers = (app)->
    [
        'rewrite'
        'site'
        'layouts'
        'static'
    ].forEach (api)->
        require("./#{api}/route")(app)

    app

module.exports = routers
