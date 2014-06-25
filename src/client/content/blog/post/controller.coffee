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

        links()

        Renderer.render(file.body).then (content)->
            $scope.content = $sce.trustAsHtml content

    links = ->
        index = Site.index.posts.indexOf file.path
        if index > 0
            $scope.previous = Site.files[Site.index.posts[index - 1]]
        if index < Site.index.posts.length - 1
            $scope.next = Site.files[Site.index.posts[index + 1]]
