class BlogCtrl
    constructor: ($http)->
        $http.get('/site.json')
        .then (get)=>
            @[k] = v for k, v of get.data.site

BlogCtrl.$inject = ['$http']

angular.module('flipflops.blog.controller', [

]).controller('BlogCtrl', BlogCtrl)
