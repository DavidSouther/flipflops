class Site
    constructor: (promise)->
        @loaded = promise.then (response)=>
            angular.extend @, response.data.site
            @files = angular.extend {}, response.data.files
            @buildIndex()
            @

    indexArrayOrder = (a, b)->
        # Base cases, either is empty
        if a.length is 0 and b.length is 0
            return 0
        if a.length is 0 and b.length > 0
            return -1
        if a.length > 0 and b.length is 0
            return 1

        # index cases, return least at index (lexicographical)
        if a[0] < b[0]
            return -1
        if a[0] > b[0]
            return 1
        if a[0] is b[0]
            return indexArrayOrder a.slice(1), b.slice(1)

        throw new Exception "Unsupported boolean magic in indexArrayOrder."

    indexOrder = (a, b)->
        indexArrayOrder(
            # Ignore the trailing index.
            a.replace(/\/index\.m(d|arkdown)/, '').split('/')
            b.replace(/\/index\.m(d|arkdown)/, '').split('/')
        )

    buildIndex: ->
        angular.forEach @files, (file, path)-> file.path = path
        @index =
            files: Object.keys(@files)
            posts: Object.keys(@files).filter((_)->_.indexOf('/posts/') is 0)
            pages: Object.keys(@files).filter((_)->_.indexOf('/pages/') is 0)
        @index.posts.sort indexOrder
        @index.pages.sort indexOrder
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
        if path is '/README.md' and @files[path]?
            return @files[path]
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
