angular.module('flipflops.content.home.controller', [
    'flipflops.site'
    'flipflops.renderer'
]).controller 'HomeCtrl', ($scope, Site, Renderer, $sce)->
    $scope.content = ''
    path = "/README.md"
    Site.loaded.then ->
        file = Site.find path
        $scope.front = file.front
        file.front.date = new Date file.front.date

        Renderer.render(file.body).then (content)->
            $scope.content = $sce.trustAsHtml content
