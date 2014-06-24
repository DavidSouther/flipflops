class Site
    constructor: (promise)->
        promise.then (response)=>
            angular.extend @, response.data.site
            @files = angular.extend {}, response.data.files

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
