angular.module('flipflops', [
    'ui.router'
    'flipflops.page'
    'flipflops.admin'
]).config (
    $urlRouterProvider
    $locationProvider
)->
    $locationProvider.html5Mode true # TODO hide behind flag.
    $urlRouterProvider.otherwise '/'
