angular.module('flipflops.content.blog',[
    'ui.router'

    'flipflops.content.blog.list'
    'flipflops.content.blog.post'
]).config ($stateProvider)->
    $stateProvider.state 'blog',
        # Need an empty ui-view for the child partials
        template: "<div ui-view></div>"
