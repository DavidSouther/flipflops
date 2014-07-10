angular.module('flipflops.page.banner.directive', [
    'page.banner.template'
]).directive 'ffHeader', ->
    restrict: 'E'
    replace: true
    templateUrl: 'page/banner'
