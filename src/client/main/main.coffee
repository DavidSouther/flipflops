angular.module('flipflops', [
    'ui.router'
    'flipflops.blog.controller'
    'flipflops.banner.directive'
    'flipflops.navigation.directive'
    'flipflops.content.directive'
    'flipflops.sidebar.directive'
    'flipflops.footer.directive'
]).config (
    $stateProvider
    $urlRouterProvider
    $locationProvider
)->
    $locationProvider.html5Mode true
