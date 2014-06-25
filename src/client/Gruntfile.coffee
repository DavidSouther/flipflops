name = require('../../package').name
Path = require 'path'

module.exports = (grunt)->
    flatten = (a, b)-> a.concat b
    prefix = (prefix)-> (str)->"#{prefix}#{str}"
    bowerPrefix = prefix("bower_components/")

    module = name

    testFileOrdering = grunt.expandFileArg('src/client', '**/')

    grunt.Config =
        watch:
            client:
                files: [
                    'src/client/**/*.js'
                    'src/client/**/*.coffee'
                    'src/client/**/*.jade'
                    'src/client/**/*.styl'
                ]
                tasks: [
                    'client'
                ]
                options:
                    spawn: false
        stassets:
            client:
                options:
                    dest: Path.resolve './tmp/build/client'
                    stassets:
                        verbose: grunt.option('verbose')
                        root: Path.resolve './src/client'
                        vendors:
                            prefix: Path.resolve './bower_components'
                            js: [
                                'angular/angular.js'
                                'angular-ui-router/release/angular-ui-router.js'
                                'angular-cookies/angular-cookies.js'
                                'angular-resource/angular-resource.js'
                                'marked/lib/marked.js'
                                # 'angular-ui/build/**/*'
                                # 'bootstrap/dist/js/bootstrap.js'
                                # 'angular-bootstrap/ui-bootstrap-tpl.js'
                                # 'angular-bootstrap/ui-bootstrap.js'
                            ]

                            css: [
                                'bootstrap/dist/css/*'
                                'bootstrop/dist/fonts/*'
                                'css-social-buttons/css/*'
                            ]
        copy:
            client:
                files: [
                    expand: true
                    cwd: 'src/client'
                    src: ['index.html', 'assets/**/*']
                    dest: 'build/client'
                ]

    # butt - Browser Under Test Tools
    butt = []
    unless process.env['DEBUG']
        if process.env['BAMBOO']
            butt = ['PhantomJS']
        else
            butt = ['Chrome']

    preprocessors =
        'src/client/**/*test.coffee': [ 'coffee' ]
        'src/client/**/*mock.coffee': [ 'coffee' ]
        'src/client/tools/*.coffee': [ 'coffee' ]
        'src/client/**/*.jade': [ 'jade', 'ng-html2js' ]

    cover =
        if process.env.DEBUG and not process.env.COVER
            'coffee'
        else
            'coverage'

    appFileOrdering = [
        'vendors.js'
        'templates.js'
        'application.js'
    ].map (_)->
        Path.resolve "./tmp/build/client/#{_}"

    for type in appFileOrdering
        if type.indexOf('.coffee') > -1
            preprocessors[type] = [cover]

    grunt.Config =
        karma:
            client:
                options:
                    browsers: butt
                    frameworks: [ 'mocha', 'sinon-chai' ]
                    reporters: [ 'spec', 'junit', 'coverage' ]
                    singleRun: true,
                    logLevel: 'INFO'
                    preprocessors: preprocessors
                    files: [
                        appFileOrdering

                        'bower_components/angular-mocks/angular-mocks.js'

                        'src/client/**/*mock.coffee'
                        'src/client/tools/**/*'

                        testFileOrdering
                    ].reduce(flatten, [])
                    junitReporter:
                        outputFile: 'build/reports/karma.xml'
                    coverageReporter:
                        type: 'lcov'
                        dir: 'build/reports/coverage/'

    grunt.registerTask 'testClient',
        'Run karma tests against the client.',
        [
            'stassets:client'
            'karma:client'
        ]

    grunt.registerTask 'client',
        'Prepare and test the client.',
        [
            'testClient'
        ]
