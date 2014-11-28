angular.module('flipflops.page.banner.directive', [
    'page.banner.template'
]).directive 'ffHeader', ->
    restrict: 'E'
    replace: true
    templateUrl: 'page/banner'
    controller: ($scope, $mdSidenav)->
        $scope.toggleNav = -> $mdSidenav('navigation').toggle()
