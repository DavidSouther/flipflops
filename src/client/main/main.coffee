angular.module('flipflops', [
    'ngMaterial'
    'ui.router'
    'flipflops.page'
]).config (
    $urlRouterProvider
    $locationProvider
)->
    # $locationProvider.html5Mode true # TODO hide behind flag.
    $urlRouterProvider.otherwise '/'
