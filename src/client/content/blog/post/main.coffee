angular.module('flipflops.content.blog.post', [
    'ui.router'
    'flipflops.content.blog.post.controller'
    'content.blog.post.template'
]).config ($stateProvider)->
    $stateProvider
    .state 'blog.post',
        url: '/posts/*path'
        controller: 'BlogPostCtrl'
        templateUrl: 'content/blog/post'
