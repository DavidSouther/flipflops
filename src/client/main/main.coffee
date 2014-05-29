mod = angular.module('flipflops', [
    'ngLocale'
    'ui.router'

])
mod.config (
    $stateProvider
    $urlRouterProvider
    $locationProvider
)->
    $locationProvider.html5Mode true
