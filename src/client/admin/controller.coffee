angular.module('flipflops.admin.controller', [
    'flipflops.page.layout.service'
]).controller 'AdminCtrl', ($scope, LayoutSvc)->
    LayoutSvc.setActiveLayout '/admin'
    $scope.admin = 'Write!'
