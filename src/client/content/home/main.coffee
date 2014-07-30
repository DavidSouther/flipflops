angular.module('flipflops.content.home', [
    'ui.router'
    'flipflops.content.home.controller'
    'content.home.template'
]).config (
    $stateProvider
)->
    $stateProvider
    .state 'home',
        url: '/'
        controller: 'HomeCtrl'
        templateUrl: 'content/home'
        resolve:
            loaded: ['Site', (_)-> _.loaded]
