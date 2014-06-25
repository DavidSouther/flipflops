class Site
    constructor: (promise)->
        @loaded = promise.then (response)=>
            angular.extend @, response.data.site
            @files = angular.extend {}, response.data.files
            @buildIndex()
            @

    buildIndex: ->
        angular.forEach @files, (file, path)->
            file.path = path
        @index =
            posts: Object.keys(@files).filter((_)->_.indexOf('/posts/') is 0)
        @posts = @index.posts
            .reduce ((a, f)=> a.push(@files[f]) ; a), []

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
