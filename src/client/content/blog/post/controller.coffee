angular.module('flipflops.content.blog.post.controller', [
    'ui.router'
    'flipflops.site'
]).controller 'BlogPostCtrl', ($scope, Site, $stateParams)->
    console.log 'Blog Post Controller', $stateParams
