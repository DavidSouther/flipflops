angular.module('flipflops.page.directive', [
    'flipflops.site.controller'
    'flipflops.page.banner.directive'
    'flipflops.page.navigation.directive'
    'flipflops.page.sidebar.directive'
    'flipflops.page.footer.directive'

    'flipflops.content'

    'page.template'
]).directive 'ffPage', ->
    restrict: 'AE'
    templateUrl: 'page'
