routers = (app)->
    [
        'rewrite'
        'site'
        'layouts'
        'static'
        'authentication'
    ].forEach (api)->
        require("./#{api}/route")(app)

    app

module.exports = routers
