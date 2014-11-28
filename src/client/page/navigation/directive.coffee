angular.module('flipflops.page.navigation.directive', [
    'page.navigation.template'
    'flipflops.site'
]).directive 'ffNavigation', ->
    restrict: 'E'
    replace: true
    templateUrl: 'page/navigation'
    controller: ($scope, Site)->
        $scope.site = Site
        $scope.isPost = (_)->
            _.indexOf('/posts/') is 0
        $scope.go = ->
