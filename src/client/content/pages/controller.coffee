angular.module('flipflops.content.pages.controller', [
    'ui.router'
    'flipflops.site'
    'flipflops.renderer'
]).controller 'PageCtrl', ($scope, Site, $stateParams, Renderer, $sce)->
    Site.loaded.then ->
        file = Site.find $stateParams.pagePath
        $scope.front = file.front
        file.front.date = new Date file.front.date
        Renderer.render(file.body).then (content)->
            $scope.content = $sce.trustAsHtml content
