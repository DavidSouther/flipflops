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
    $scope.type = 'Page'
    file = Site.find $stateParams.path
    $scope.front = file.front

    LayoutSvc.setActiveLayout $scope.front.layout

    $scope.nav = {}
    index = Site.index.pages.indexOf file.path
    if index > 0
        $scope.nav.previous = Site.files[Site.index.pages[index - 1]]
        $scope.nav.previous.state = 'page'
    if index < Site.index.pages.length - 1
        $scope.nav.next = Site.files[Site.index.pages[index + 1]]
        $scope.nav.next.state = 'page'

    Renderer.render(file.body).then (content)->
        $scope.content = $sce.trustAsHtml content
