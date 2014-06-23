angular.module('flipflops.sidebar.directive', [
    'main.sidebar.template'
]).directive 'ffSidebar', ->
    restrict: 'E'
    replace: true
    templateUrl: 'main/sidebar'
