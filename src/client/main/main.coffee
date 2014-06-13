angular.module('flipflops', [
    'ui.router'
    'flipflops.blog.controller'
    'flipflops.header.directive'
]).config (
    $stateProvider
    $urlRouterProvider
    $locationProvider
)->
    $locationProvider.html5Mode true
