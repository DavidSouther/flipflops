angular.module('flipflops.content.home.controller', [
    'flipflops.site'
    'flipflops.renderer'
    'flipflops.layout.service'
]).controller 'HomeCtrl', ($scope, Site, Renderer, $sce, LayoutSvc)->
    $scope.content = ''
    LayoutSvc.setActiveLayout 'home'
    path = "/README.md"
    Site.loaded.then ->
        file = Site.find path
        $scope.front = file.front
        file.front.date = new Date file.front.date

        Renderer.render(file.body).then (content)->
            $scope.content = $sce.trustAsHtml content
