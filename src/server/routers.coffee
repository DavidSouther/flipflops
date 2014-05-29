routers = (app)->
    [
    ].forEach (api)->
        require("./#{api}/route")(app)

    app

module.exports = routers
