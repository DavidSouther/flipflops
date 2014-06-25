angular.module('flipflops.content.blog.list', [
    'ui.router'
    'flipflops.content.blog.list.controller'
    'content.blog.list.template'
]).config ($stateProvider)->
    $stateProvider
    .state 'blog.list',
        url: '/posts/'
        controller: 'BlogListCtrl'
        templateUrl: 'content/blog/list'
