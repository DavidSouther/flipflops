rewriter = require './rewriter'
module.exports = (app)->
    app.get(/.*\/index.m(?:d|arkdown)$/, rewriter.rewrite('/'))
    app.get(/.+\/$/, rewriter.rewrite('/'))
