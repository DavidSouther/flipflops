angular.module('flipflops.content.blog.post.controller', [
    'ui.router'
    'flipflops.site'
    'flipflops.renderer'
]).controller 'BlogPostCtrl', ($scope, Site, $stateParams, Renderer, $sce)->
    $scope.content = ''
    file = "/posts/#{$stateParams.blogPath}"
    Site.loaded.then ->
        Renderer.render(Site.files[file]).then (content)->
            $scope.content = $sce.trustAsHtml content
