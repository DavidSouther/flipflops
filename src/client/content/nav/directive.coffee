angular.module('flipflops.content.nav.directive', [
    'content.nav.template'
    'flipflops.content.nav.controller'
]).directive 'contentNav', ->
    replace: true
    restrict: 'AE'
    scope:
        'next': '=contentNext'
        'previous': '=contentPrevious'
        'state': '=contentState'
    controller: 'ContentNavCtrl'
    templateUrl: 'content/nav'
    link: ($scope, $element, $attributes)->
        
