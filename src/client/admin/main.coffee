angular.module('flipflops.admin', [
    'flipflops.admin.login'
    'flipflops.admin.controller'
    'admin.template'
]).config ($stateProvider)->
    $stateProvider
    .state 'admin',
        url: '/ff-admin'
        controller: 'AdminCtrl'
        templateUrl: 'admin'
