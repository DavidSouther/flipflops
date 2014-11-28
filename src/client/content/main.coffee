angular.module('flipflops.content', [
    'flipflops.content.home'
    'flipflops.content.blog'
    'flipflops.content.pages'
    'flipflops.content.nav'
    'ngAnimate'
]).run ($document, $rootScope)->
    $document.bind 'keyup', (ev)->
        if ev.which is 39
            $rootScope.$broadcast "NEXT!"
        if ev.which is 37
            $rootScope.$broadcast "PREVIOUS!"
