fileInput = ($parse)->
    restrict: 'EA'
    template: '<input type="file" />'
    replace: true
    link: (scope, element, attrs)->
        modelGet = $parse attrs.fileInput
        modelSet = modelGet.assign
        onChange = $parse attrs.onChange

        updateModel = ->
            scope.$apply ->
                modelSet scope, element[0].files[0]
                onChange scope

        element.bind 'change', updateModel
        scope.$watch modelGet, (newVal)->
            element[0].value = "" unless newVal

angular.module('teals.scavenger.fileInput', [])
.directive 'fileInput', fileInput
