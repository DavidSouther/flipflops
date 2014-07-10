angular.module('flipflops.content.pages', [
    'ui.router'
    'flipflops.content.pages.controller'
    'content.pages.template'
]).config ($stateProvider)->
    $stateProvider.state
        name: 'page'
        url: '/*path'
        controller: 'PageCtrl'
        templateUrl: 'content/pages'
