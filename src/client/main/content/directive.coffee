angular.module('flipflops.content.directive', [
    'main.content.template'
]).directive 'ffContent', ->
    restrict: 'E'
    replace: true
    templateUrl: 'main/content'
