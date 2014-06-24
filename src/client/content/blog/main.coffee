angular.module('flipflops.content.blog',[
    'ui.router'

    'flipflops.content.blog.list.controller'
    'content.blog.list.template'
    'flipflops.content.blog.post.controller'
    'content.blog.post.template'
]).config ($stateProvider)->
    $stateProvider
    .state('blog', {})
    .state 'blog.list',
        url: '/posts'
        controller: 'BlogListCtrl'
        templateUrl: 'content/blog/list'
    .state 'blog.post',
        url: '/posts/*blogPath'
        controller: 'BlogPostCtrl'
        templateUrl: 'content/blog/post'
    console.log 'Added blog states.'
