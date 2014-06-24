angular.module('flipflops.sidebar.directive', [
    'main.sidebar.template'
]).directive 'ffSidebar', ->
    restrict: 'E'
    replace: true
    templateUrl: 'main/sidebar'
    controller: ($scope, $state, $stateParams)->
        $scope.$state = $state
        $scope.$stateParams = $stateParams
