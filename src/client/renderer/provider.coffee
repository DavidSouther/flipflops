angular.module('flipflops.renderer', [

]).provider 'Renderer', ->
    options =
        renderer: marked.Renderer
        gfm: true
        tables: true
        breaks: no
        pedantic: no
        sanitize: yes
        smartLists: yes
        smartypants: no

    @updateOptions = (opts)->
        options = angular.extend options, opts

    Renderer = ($q)->
        options.renderer = new options.renderer()
        marked.setOptions options
        render: (src)->
            defer = $q.defer()
            content = marked src
            defer.resolve content
            defer.promise

    Renderer.$inject = ['$q']

    @$get = Renderer

    return
