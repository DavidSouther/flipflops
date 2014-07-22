class Authentication
    constructor: (@$cookies, @$http, @$location)->
        @check()
        @user =
            username: ''
            password: ''

    check: ->
        # Evaluate for its $cookies side effects
        @$http.get('/auth/check')

    isLoggedIn: ->
        @$cookies.li? and @$cookies.li isnt 0

    login: ->
        @$http
        .post('/auth/login/local', @user)
        .success => @$location.url '/'

Authentication.$inject = [
    '$cookies'
    '$http'
    '$location'
]

angular.module('flipflops.admin.login.service', [
    'ngCookies'
]).service 'AuthSvc', Authentication
