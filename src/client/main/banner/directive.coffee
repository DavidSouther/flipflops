angular.module('flipflops.banner.directive', [
    'main.banner.template'
]).directive 'ffHeader', ->
    restrict: 'E'
    replace: true
    templateUrl: 'main/banner'
