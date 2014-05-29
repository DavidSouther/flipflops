name = require('../../package').name

module.exports = (grunt)->
    flatten = (a, b)-> a.concat b
    prefix = (prefix)-> (str)->"#{prefix}#{str}"
    bowerPrefix = prefix("bower_components/")


    module = name
    appFileOrdering = [
        '**/template.jade'
        '**/main.coffee'
        '**/service.coffee'
        '**/controller.coffee'
        '**/directive.coffee'
    ].map((a)->"src/client/#{a}").reduce flatten, []

    testFileOrdering = grunt.expandFileArg('src/client', '**/')

    vendorJsOrdering = [
        'angular/angular.js'
        'angular-ui-router/release/angular-ui-router.js'
        'angular-cookies/angular-cookies.js'
        'angular-resource/angular-resource.js'
        # 'angular-ui/build/**/*'
        # 'bootstrap/dist/js/bootstrap.js'
        # 'angular-bootstrap/ui-bootstrap-tpl.js'
        # 'angular-bootstrap/ui-bootstrap.js'
    ]

    vendorCssOrdering = [
        'bootstrap/dist/css/*'
        'bootstrop/dist/fonts/*'
        'css-social-buttons/css/*'
    ]

    jadeTemplateId = (filepath)->
        r_template = /^src\/client\/(.*)\/template.(html|jade)$/
        path = filepath.replace r_template, '$1'
    jadeTemplateModule = (filepath)->
        r_template = /^src\/client\/(.*)\/template.(html|jade)$/
        path = filepath.replace r_template, "#{name}.$1.template"
    jadeOpts =
        moduleName: "#{name}.templates"
        processName: jadeTemplateId
        newModule: true

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

        jade:
            index:
                files: {
                    'build/client/index.html': ['src/client/index.jade']
                }
        ngjade:
            templates:
                files: [{
                    expand: false
                    src: ['src/client/**/template.jade']
                    dest: 'build/client/templates.js'
                }]
                options: jadeOpts
        stylus:
            options:
                paths: [
                    'src/client/stylus/definitions'
                ]
                import: [
                    'mixins'
                    'variables'
                    'nib'
                ]
            all:
                files:
                    'build/client/all.css': "src/client/**/all.styl"
            print:
                files:
                    'build/client/print.css': "src/client/**/print.styl"
            screen:
                files:
                    'build/client/screen.css': "src/client/**/screen.styl"

        concat:
            vendorJs:
                src: vendorJsOrdering.map bowerPrefix
                dest:  'build/client/vendors.js'

            vendorCss:
                src:  vendorCssOrdering.map bowerPrefix
                dest: 'build/client/vendors.css'

        copy:
            client:
                files: [
                    expand: true
                    cwd: 'src/client'
                    src: ['index.html', 'assets/**/*']
                    dest: 'build/client'
                ]

        coffee:
            options:
                bare: false
                join: true
            client:
                files:
                    'build/client/app.js': appFileOrdering
                        .filter (file)-> file.match(/\.coffee$/)

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
                        'build/client/vendors.js'

                        'bower_components/angular-mocks/angular-mocks.js'
                        'src/client/**/*mock.coffee'
                        'src/client/tools/**/*'
                        appFileOrdering

                        testFileOrdering
                    ].reduce(flatten, [])
                    ngHtml2JsPreprocessor:
                        cacheIdFromPath: jadeTemplateId
                        moduleName: jadeOpts.moduleName
                    junitReporter:
                        outputFile: 'build/reports/karma.xml'
                    coverageReporter:
                        type: 'lcov'
                        dir: 'build/reports/coverage/'

    grunt.registerTask 'clientDependencies',
        'Prepare any client dependencies',
        [
            'concat:vendorJs'
            'concat:vendorCss'
        ]

    grunt.registerTask 'testClient',
        'Run karma tests against the client.',
        [
            'karma:client'
        ]

    grunt.registerTask 'buildClient',
        'Prepare the build/ directory with static client files.',
        [
            'copy:client'
            'ngjade:templates'
            'jade:index'
            'coffee:client'
            'stylus'
        ]

    grunt.registerTask 'client',
        'Prepare and test the client.',
        [
            'clientDependencies'
            'testClient'
            'buildClient'
        ]
