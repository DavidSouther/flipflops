class Site
    constructor: (promise)->
        @loaded = promise.then (response)=>
            angular.extend @, response.data.site
            @files = angular.extend {}, response.data.files
            @buildIndex()
            @

    indexOrder = (a, b)->
        depth_a = a.split('/').length
        depth_b = b.split('/').length
        if depth_a < depth_b
            return -1
        else if depth_b < depth_a
            return 1
        else
            if a < b
                return -1
            else if b < a
                return 1
            else
                return 0

    buildIndex: ->
        angular.forEach @files, (file, path)-> file.path = path
        @index =
            files: Object.keys(@files)
            posts: Object.keys(@files).filter((_)->_.indexOf('/posts/') is 0)
            pages: Object.keys(@files).filter((_)->_.indexOf('/pages/') is 0)
        # @index.posts.sort indexOrder
        # @index.pages.sort indexOrder
        @index.chapters = @index.pages.filter (path)->
            path.split('/').length <= (3 + 1) # /pages/... for 3
        @posts = @index.posts.reduce ((a, f)=> a.push(@files[f]) ; a), []
        @pages = @index.pages.reduce ((a, f)=> a.push(@files[f]) ; a), []

    link: (file)->
        (file or '').replace('/pages/', '')
            .replace('/posts/', '')
            .replace('index.md', '')
            .replace('index.markdown', '')

    findNoIndex: (path)->
        @files["#{path}index.md"] or
            @files["#{path}index.markdown"] or
            @files["#{path}/index.md"] or
            @files["#{path}/index.markdown"] or
            null

    find: (path)->
        if path.indexOf('/posts/') isnt 0
            path = "/pages/#{path}"
        @findNoIndex path

angular.module('flipflops.site', [

]).provider 'Site', ->
    config = '/site.json'

    @configPath = (_)-> config = _

    siteFactory = ($http)->
        promise = $http.get(config)
        return new Site promise

    siteFactory.$inject = ['$http']

    @$get = siteFactory

    return
