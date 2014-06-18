class BlogCtrl
    constructor: ->
        @title = 'FlipFlops'
        @subtitle = 'Quit blogging. Go to the beach.'
        @author = 'David Souther (DEVELOPMENT)'

BlogCtrl.$inject = []

angular.module('flipflops.blog.controller', [

]).controller('BlogCtrl', BlogCtrl)
