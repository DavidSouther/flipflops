angular.module('flipflops.page.footer.directive', [
    'page.footer.template'
]).directive 'ffFooter', ->
    restrict: 'E'
    replace: true
    templateUrl: 'page/footer'
