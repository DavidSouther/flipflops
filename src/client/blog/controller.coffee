class BlogCtrl
    constructor: ($http)->
        $http.get('/site.json')
        .then (response)=>
            angular.extend @, response.data.site

BlogCtrl.$inject = ['$http']

angular.module('flipflops.blog.controller', [

]).controller('BlogCtrl', BlogCtrl)
