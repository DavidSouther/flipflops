angular.module('flipflops.content', [
    'flipflops.content.home'
    'flipflops.content.blog'
    'flipflops.content.pages'
    'ngAnimate'
]).run ($document, $rootScope)->
    # $document.bind 'keypress', (ev)->
    #     console.log('Got keypress:', ev.which, ev.keyCode)
    #     $rootScope.$broadcast('keypress', ev)
    #     $rootScope.$broadcast("keypress:#{ev.which}", ev)
    #
    # $document.bind 'keydown', (ev)->
    #     console.log('Got keydown:', ev.which, ev.keyCode)
    #     $rootScope.$broadcast('keydown', ev)
    #     $rootScope.$broadcast("keydown:#{ev.which}", ev)

    $document.bind 'keyup', (ev)->
        # console.log('Got keyup:', ev.which, ev.keyCode)
        # $rootScope.$broadcast('keyup', ev)
        # $rootScope.$broadcast("keyup:#{ev.which}", ev)
        if ev.which is 39
            $rootScope.$broadcast "NEXT!"
        if ev.which is 37
            $rootScope.$broadcast "PREVIOUS!"
