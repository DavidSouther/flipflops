Q = require('q')
should = require('should')
protractor = require('protractor')
By = require('selenium-webdriver').By
_ = require('underscore')

mappings = require('../mappings')

module.exports = ->
    require('qcumber')(@)
    require('qcumberbatch').steps.call(@)

    @protractor = protractor.wrapDriver @world.driver

    PORT = process.env.PORT || 80
    APP = process.env.APPLICATION || ''
    ROOT = process.env.APP_ROOT || "http://localhost:#{PORT}/#{APP}"
    process.env.APP_ROOT = ROOT

    @Given /on the site/, =>
        @world.visit(ROOT)
        .then => @protractor.waitForAngular()

    @When /type "([^"]*)" into the "([^"]*)"/, (text, field)=>
        selector = mappings[field]
        @world.find(selector)
        .sendKeys(text)
        .then => @protractor.waitForAngular()

    @When /click(?: the)? "([^"]+)"/, (link)->
        selector = mappings[link] + " a"
        @world.find(selector)
        .click().then => @protractor.waitForAngular()

    @When /log in/, ->
        selector = mappings['student login']
        @world.findAll(selector)
        .then (elements)->
            if elements.length > 0
                elements[0].click()
            else
                true

    @When /toggle the "([^"]+)" hunt/, (title)=>
        selector = mappings["hunt table toggle"]# + ":contains('#{title}')"
        @world.find(selector)
        .click().then => @protractor.waitForAngular()

    @Then /should see "([^"]+)" in the "([^"]*)"/, (text, field)=>
        selector = mappings[field]
        @world.find(selector)
        .getText (element)->
            element.should.equal text

    @Then /"([^"]*)" should have links/, (nav, links)=>
        selector = mappings[nav]
        @world.find(selector)
        .getText (elementText)->
            console.log "Text is `#{elementText}`"
            links.split('\n').forEach (linkText)->
                elementText.indexOf(linkText).shoud.be.greaterThan -1

    @Then /"([^"]*)" should have several rows/, (table)=>
        selector = mappings[table] + ' tr'
        @world.findAll(selector)
        .then (elements)->
            elements.length.should.be.greaterThan 1

    @Then /"([^"]*)" should be filled with "([^"]*)"/, (field, expected)->
        selector = mappings[field]
        @world.find(selector)
        .then (element)->
            element.getAttribute('value')
            .then (value)->
                value.should.equal expected
