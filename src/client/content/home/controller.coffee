angular.module('flipflops.content.home.controller', [
    'flipflops.site'
    'flipflops.renderer'
    'flipflops.page.layout.service'
]).controller 'HomeCtrl', ($scope, Site, Renderer, $sce, LayoutSvc)->
    $scope.content = ''
    LayoutSvc.setActiveLayout 'content/home'
    path = "/README.md"

    file = Site.find path
    $scope.front = file.front
    file.front.date = new Date file.front.date

    Renderer.render(file.body).then (content)->
        $scope.content = $sce.trustAsHtml content

    $scope.nav =
        next:
            if Site.pages.length > 0
                angular.extend {state: 'page'}, Site.pages[0]
            else if Site.posts.length > 0
                angular.extend {state: 'blog.post'}, Site.posts[0]
            else
                null
