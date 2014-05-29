module.exports = (grunt)->
    features = grunt.expandFileArg 'src/features/integration/users', '**/', '*'

    grunt.Config =
        cucumberjs:
            integration:
                files:
                    src: features
                options:
                    tags: '~@broken'
            current:
                files:
                    src: features
                options:
                    tags: '@current'
            options:
                steps: 'src/features/integration/steps'
                format: 'pretty'

    grunt.registerTask 'featuresEnvironment', ->
        process.env.NODE_ENV = 'development'
        process.env.MONGO_PORT = 11311

    grunt.registerTask 'featuresCurrent',
        'Run CucumberJS features tagged @current',
        [
            'featuresEnvironment'
            'selenium-launch'
            'client-server-launch'
            'cucumberjs:current'
        ]

    grunt.registerTask 'features',
        'Run all CucumberJS feature tests.',
        [
            'featuresEnvironment'
            'selenium-launch'
            'client-server-launch'
            'cucumberjs:current'
            'cucumberjs:integration'
        ]
