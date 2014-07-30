angular.module('flipflops.content.pages', [
    'ui.router'
    'flipflops.content.pages.controller'
    'content.pages.template'
    'flipflops.content.directive'
    'flipflops.site'
]).config ($stateProvider)->
    $stateProvider.state
        name: 'page'
        url: '/*path'
        controller: 'ContentPageCtrl'
        templateUrl: 'content/pages'
        resolve:
            site: ['Site', (Site)-> Site.loaded]
