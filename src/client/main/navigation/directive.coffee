angular.module('flipflops.navigation.directive', [
    'main.navigation.template'
]).directive 'ffNavigation', ->
    restrict: 'E'
    replace: true
    templateUrl: 'main/navigation'
