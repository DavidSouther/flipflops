module.exports = (grunt)->
    features = grunt.expandFileArg 'src/features/integration/users', '**/', '*'

    process.env.SELENIUM_BROWSER = process.env.SELENIUM_BROWSER || 'chrome'

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

    grunt.registerTask 'featuresCurrent',
        'Run CucumberJS features tagged @current',
        [
            'selenium-launch'
            'client-server-launch'
            'cucumberjs:current'
        ]

    grunt.registerTask 'features',
        'Run all CucumberJS feature tests.',
        [
            'selenium-launch'
            'client-server-launch'
            'cucumberjs:current'
            'cucumberjs:integration'
        ]
