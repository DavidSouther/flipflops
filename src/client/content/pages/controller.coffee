angular.module('flipflops.content.pages.controller', [
    'ui.router'
    'flipflops.site'
    'flipflops.renderer'
]).controller 'PageCtrl', ($scope, Site, $stateParams, Renderer, $sce)->
    Site.loaded.then ->
        file = Site.find $stateParams.pagePath
        $scope.front = file.front

        link file

        Renderer.render(file.body).then (content)->
            $scope.content = $sce.trustAsHtml content

    link = (file)->
        index = Site.index.pages.indexOf file.path
        if index > 0
            $scope.previous = Site.files[Site.index.pages[index - 1]]
        if index < Site.index.pages.length - 1
            $scope.next = Site.files[Site.index.pages[index + 1]]
