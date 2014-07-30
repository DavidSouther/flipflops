angular.module('flipflops.content.nav.controller', [
    'ui.router'
    'flipflops.site'
]).controller 'ContentNavCtrl', ($scope, $state, Site)->
    $scope.srefize = (where)->
        return '' unless where
        $state.href where.state, {path: Site.link where.path}
    $scope.$on 'NEXT!', ->
        go $scope.next if $scope.next
    $scope.$on 'PREVIOUS!', ->
        go $scope.previous if $scope.previous
    go = (where)->
        $state.go where.state, {path: Site.link where.path}
