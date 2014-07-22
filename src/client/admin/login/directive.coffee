angular.module('flipflops.admin.login.directive', [
    'flipflops.admin.login.service'
    'flipflops.page.layout.service'
    'admin.login.template'
])
.config ($stateProvider)->
    $stateProvider.state
        name: 'login'
        url: '/login/'
        template: '<login></login>'

.run ($rootScope, $state, AuthSvc)->
    loginRedirect = ->
        if $state.includes 'admin'
            unless AuthSvc.isLoggedIn() or $state.is('login')
                $state.go('login')
    $rootScope.$on '$locationChangeSuccess', loginRedirect
    loginRedirect()

.directive 'login', ->
    restrict: 'AE'
    templateUrl: 'admin/login'
    controller: ($scope, AuthSvc, LayoutSvc)->
        $scope.auth = AuthSvc
        LayoutSvc.setActiveLayout 'admin/login'
