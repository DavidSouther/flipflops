module.exports = (grunt)->
    grunt.Config =
        copy:
            deploy:
                files: [
                    expand: true
                    cwd: 'src/deploy'
                    src: ['node/**/*', 'mongo/**/*']
                    dest: 'build/deploy'
                ]

    grunt.registerTask 'deploy',
        'Move deploy management scripts to the right places.',
        [ 'copy:deploy' ]
