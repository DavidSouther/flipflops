angular.module('flipflops', [
    'ui.router'
    'flipflops.page'
]).config (
    $stateProvider
    $urlRouterProvider
    $locationProvider
)->
    $locationProvider.html5Mode true # TODO hide behind flag.
    $urlRouterProvider.otherwise '/01_layout'
