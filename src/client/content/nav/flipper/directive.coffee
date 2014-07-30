angular.module('flipflops.content.nav.flipper.directive', [
])
.directive 'NavFlipper', ->
    restrict: 'C'
    link: ($scope, $element)->
        $scope.$on 'NEXT!', ->
            $element.addClass '-right'
            $element.removeClass '-left'
        $scope.$on 'PREVIOUS!', ->
            $element.removeClass '-right'
            $element.addClass '-left'
        $scope.$on '$stateChangeSuccess', ->
            $element.removeClass '-right'
            $element.removeClass '-left'
