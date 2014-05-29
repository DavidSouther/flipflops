angular.module('th.sort', [
    'teals.templates'
]).directive 'sort', ->
    restrict: 'A'
    replace: false
    transclude: true
    templateUrl: 'util/thsort'
    scope: {}
    link: ($scope, $element, $attrs)->
        field = $scope.field = $attrs['sort']
        $parent = $scope.$parent
        $element.on 'click', -> $scope.$apply ->
            $parent.order = field
            $parent.direction[field] = !$parent.direction[field]
            dir = $parent.direction[field]
            $scope.direction = if dir then 'down' else 'up'
