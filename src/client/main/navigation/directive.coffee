angular.module('flipflops.navigation.directive', [
    'main.navigation.template'
]).directive 'ffNavigation', ->
    restrict: 'E'
    replace: true
    templateUrl: 'main/navigation'
    controller: ($scope)->
        $scope.isPost = (_)->
            console.log arguments
            _.indexOf('/posts/') is 0
