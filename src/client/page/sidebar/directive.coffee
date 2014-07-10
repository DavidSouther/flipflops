angular.module('flipflops.page.sidebar.directive', [
    'page.sidebar.template'
]).directive 'ffSidebar', ->
    restrict: 'E'
    replace: true
    templateUrl: 'page/sidebar'
    controller: ($scope, $state, $stateParams)->
        $scope.$state = $state
        $scope.$stateParams = $stateParams
