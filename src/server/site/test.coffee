should = require "should"
global.root = require('path').join('.')
app = require('express')()

# TODO This depends on a successful build
require('./route')(app)
request = require('supertest')(app)

describe "Server", ->
    describe "site.json", ->
        it "returns site settings", (done)->
            request.get('/site.json')
            .expect(200)
            .end done

        it "ncludes settings from the fs", (done)->
            request.get('/site.json')
            .end (err, res)->
                done(err) if err
                body = JSON.parse(res.text)
                body.should.have.property 'site'
                body.site.should.have.property 'title'
                body.site.title.should.equal 'FlipFlops'
                done()
