class Authentication
    constructor: (@$cookies, @$http, @$state)->
        @check()
        @user =
            username: ''
            password: ''

    check: ->
        # Evaluate for its $cookies side effects
        # @$http.get('/auth/check')

    isLoggedIn: ->
        @$cookies.li? and @$cookies.li isnt 0

    login: ->
        @$http
        .post('/auth/login/file', @user)
        .success => @$state.go 'admin'

Authentication.$inject = [
    '$cookies'
    '$http'
    '$state'
]

angular.module('flipflops.admin.login.service', [
    'ngCookies'
]).service 'AuthSvc', Authentication
