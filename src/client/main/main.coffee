angular.module('flipflops', [
    'ui.router'
    'flipflops.site.controller'
    'flipflops.banner.directive'
    'flipflops.navigation.directive'
    'flipflops.sidebar.directive'
    'flipflops.footer.directive'

    'flipflops.content'
]).config (
    $stateProvider
    $urlRouterProvider
    $locationProvider
)->
    $locationProvider.html5Mode true
    $urlRouterProvider.otherwise '/'
