angular.module('flipflops.page.directive', [
    'flipflops.site.controller'
    'flipflops.page.banner.directive'
    'flipflops.page.navigation.directive'
    'flipflops.page.sidebar.directive'
    'flipflops.page.footer.directive'

    'flipflops.content.nav.flipper.directive'
    
    'flipflops.content'
    'flipflops.page.layout.service'

    'page.template'
    'flipflops.layouts.templates'
]).directive 'ffPage', ->
    restrict: 'AE'
    templateUrl: 'page'
    controller: ($scope, LayoutSvc)->
        $scope.layout = 'home'
        $scope.layouts = LayoutSvc
