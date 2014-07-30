angular.module('flipflops.content.directive', [
    'content.template'
]).directive 'ffContent', ->
    restrict: 'E'
    templateUrl: 'content'
    transclude: true
    scope:
        type: '='
        nav: '='
