angular.module('flipflops.renderer', [

]).provider 'Renderer', ->
    options =
        renderer: marked.Renderer
        gfm: true
        tables: true
        breaks: no
        pedantic: no
        sanitize: no # Possibly dangerous, especially with comments.
        smartLists: yes
        smartypants: no
        highlight: (code, language)->
            if language
                hljs.highlight(language, code).value
            else
                hljs.highlightAuto(code).value

    @defineLanguage = (name, lang) -> hljs.registerLanguage name, -> lang
    @registerLanguage = hljs.registerLanguage

    treeLang = ->
        contains: [
            hljs.HASH_COMMENT_MODE
        ]

    @registerLanguage 'tree', treeLang

    @updateOptions = (opts)->
        options = angular.extend options, opts

    Renderer = ($q)->
        options.renderer = new options.renderer()
        marked.setOptions options
        render: (src)->
            $q.when marked src

    Renderer.$inject = ['$q']

    @$get = Renderer

    return
