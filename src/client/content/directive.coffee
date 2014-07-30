angular.module('flipflops.content.directive', [
    'content.template'
    'flipflops.content.controller'
]).directive 'ffContent', ->
    restrict: 'E'
    templateUrl: 'content'
    transclude: true
    scope:
        type: '='
        nav: '='
