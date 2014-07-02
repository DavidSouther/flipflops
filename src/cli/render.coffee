Q = require 'q'
Path = require 'path'
mkdirp = require 'mkdirp'
stassets = require 'stassets'
express = require 'express'
request = require 'request'
fs = require 'graceful-fs'


module.exports = (dest)->
    success = (_)->
        console.log 'Written successfully.'
        console.log "Check #{dest}"


    failure = (err)->
        console.log 'Error writing files'
        console.log err

    mkdirp dest, (err)->
        if err
            console.log err
            return

        # options = require process.env.CONFIG_FILE

        # console.log options

        options =
            verbose: yes
            root: Path.resolve __dirname, '..', 'client'
            vendors:
                prefix: Path.resolve __dirname, '../../bower_components'
                js: [ 'angular/angular.js' ]
                css: [ 'bootstrap/dist/css/*.css', '!*.min.css' ]

        files = [
            'index.html'
            'app.js'
            'application.js.map'
            'templates.js'
            'vendors.js'
            'vendors.css'
            'all.css'
            'screen.css'
            'print.css'
            'site.json'
        ]

        compiler = new stassets.Stassets options
        compiler.promise.catch failure

        app = require('../server/server')

        getFile = (file)->
            defer = Q.defer()

            finish = (EE)->
                EE
                .on('error', (err)-> defer.reject err )
                .on('end', -> defer.resolve() )
                .on('close', -> defer.resolve() )

            finish stream = fs.createWriteStream("#{dest}/#{file}")
            finish request("http://127.0.0.1:1024/#{file}").pipe(stream)
            defer.promise

        writeFiles = ->
            promises = files.map getFile
            Q.all(promises)
            .then(success, failure)
            .then -> process.exit()

        app.start ->
            setTimeout writeFiles, 1000
