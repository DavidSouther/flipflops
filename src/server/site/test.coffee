should = require "should"
global.root = require('path').join('.')
app = require('express')()

require('./route')(app)
request = require('supertest')(app)

describe "Server", ->
    describe "site.json", ->
        it "returns site settings", (done)->
            request.get('/site.json')
            .expect(200)
            .end done

        it "includes settings from the fs", (done)->
            request.get('/site.json')
            .end (err, res)->
                done(err) if err
                body = JSON.parse(res.text)
                body.should.have.property 'site'
                body.site.should.have.property 'title'
                body.site.title.should.equal 'FlipFlops'
                done()

        it "loads files from the site", (done)->
            request.get('/site.json')
            .end (err, res)->
                done(err) if err
                body = JSON.parse(res.text)
                body.should.have.property 'files'
                tf = body.files['/posts/2014/06/23/test/index.md']
                tf.front.author.should.match /David Souther/
                tf.front.date.should.match /2014-06-23/
                done()
