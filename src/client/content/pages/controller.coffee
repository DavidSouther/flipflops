angular.module('flipflops.content.pages.controller', [
    'ui.router'
    'flipflops.site'
    'flipflops.renderer'
]).controller 'ContentPageCtrl', (
    $scope
    LayoutSvc
    Site
    $state
    $stateParams
    Renderer
    $sce
)->
    Site.loaded.then ->
        file = Site.find $stateParams.path
        $scope.front = file.front

        LayoutSvc.setActiveLayout $scope.front.layout

        link file

        Renderer.render(file.body).then (content)->
            $scope.content = $sce.trustAsHtml content

    link = (file)->
        index = Site.index.pages.indexOf file.path
        if index > 0
            $scope.previous = Site.files[Site.index.pages[index - 1]]
        if index < Site.index.pages.length - 1
            $scope.next = Site.files[Site.index.pages[index + 1]]
