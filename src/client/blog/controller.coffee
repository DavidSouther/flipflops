class BlogCtrl
    constructor: ->
        @title = 'FlipFlops'
        @subtitle = 'Quite blogging. Go to the beach.'

BlogCtrl.$inject = []

angular.module('flipflops.blog.controller', [

]).controller 'BlogCtrl', BlogCtrl
