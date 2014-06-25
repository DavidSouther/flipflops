angular.module('flipflops.content.blog.post.controller', [
    'ui.router'
    'flipflops.site'
    'flipflops.renderer'
]).controller 'BlogPostCtrl', ($scope, Site, $stateParams, Renderer, $sce)->
    $scope.content = ''
    file = "/posts/#{$stateParams.blogPath}"
    Site.loaded.then ->
        file = Site.files[file]
        $scope.front = file.front
        file.front.date = new Date file.front.date
        Renderer.render(file.body).then (content)->
            $scope.content = $sce.trustAsHtml content
