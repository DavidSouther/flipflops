angular.module('flipflops.footer.directive', [
    'main.footer.template'
]).directive 'ffFooter', ->
    restrict: 'E'
    replace: true
    templateUrl: 'main/footer'
