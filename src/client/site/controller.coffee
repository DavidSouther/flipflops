angular.module('flipflops.site.controller', [
    'flipflops.site'
]).controller 'Site', ($scope, Site)->
    $scope.site = Site
