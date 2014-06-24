angular.module('flipflops', [
    'ui.router'
    'flipflops.site.controller'
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
    $urlRouterProvider.otherwise('/');
    $stateProvider
    .state 'home',
        url: '/'
    .state 'blog',
        url: '/{blogPath:20[01][0-9]*}'
        
