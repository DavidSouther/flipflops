process.env.LOG_LEVEL = 'error'
module.exports = (grunt)->
    testFiles = grunt.expandFileArg('src/server', '*/')
    grunt.Config =
        mochaTest:
            server:
                options:
                    reporter: 'spec'
                src: testFiles
        copy:
            server:
                files: [
                    expand: true
                    cwd: 'src/server'
                    src: ['**/*', '!**/*test*']
                    dest: 'build/server'
                ]
        watch:
            server:
                files: testFiles
                tasks: [
                    'testServer'
                ]
                options:
                    spawn: false

    grunt.registerTask 'client-server-launch', ->
        done = @async()
        require('./server').start(done)

    grunt.registerTask 'testServer', 'Test the server.', ['mochaTest:server']

    grunt.registerTask 'server', 'Prepare the server.', [
        'testServer'
        'copy:server'
    ]
