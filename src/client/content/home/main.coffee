angular.module('flipflops.content.home', [
    'ui.router'
    'content.home.template'
]).config (
    $stateProvider
)->
    $stateProvider
    .state 'home',
        url: '/'
        templateUrl: 'content/home'
