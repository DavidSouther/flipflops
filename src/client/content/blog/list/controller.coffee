angular.module('flipflops.content.blog.list.controller', [
    'ui.router'
    'flipflops.site'
]).controller 'BlogListCtrl', ($scope, Site, $stateParams)->
    console.log 'Blog List Controller', $stateParams
