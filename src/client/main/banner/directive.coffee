angular.module('flipflops.header.directive', [
    'main.banner.template'
]).directive 'ffHeader', ->
    restrict: 'E'
    templateUrl: 'main/banner'
