angular.module('flipflops.content.nav.controller', [
    'ui.router'
    'flipflops.site'
]).controller 'ContentNavCtrl', ($scope, $state, Site)->
    $scope.srefize = (path)->
        $state.href $scope.state, {path: Site.link path}
    $scope.$on 'NEXT!', ->
        go $scope.next if $scope.next
    $scope.$on 'PREVIOUS!', ->
        go $scope.previous if $scope.previous
    go = (where)->
        $state.go $scope.state, {path: Site.link where.path}
