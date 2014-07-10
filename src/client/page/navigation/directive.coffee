angular.module('flipflops.page.navigation.directive', [
    'page.navigation.template'
]).directive 'ffNavigation', ->
    restrict: 'E'
    replace: true
    templateUrl: 'page/navigation'
    controller: ($scope)->
        $scope.isPost = (_)->
            _.indexOf('/posts/') is 0
