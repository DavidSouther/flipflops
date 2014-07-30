DEFAULT = '/page/layouts/default'

class LayoutSvc
    constructor: ->
        @active = DEFAULT

    setActiveLayout: (layout = DEFAULT)->
        # console.log "Page setting layout to #{layout}"
        # @active = layout

angular.module('flipflops.page.layout.service', [
    'flipflops.content.nav.directive'
]).service 'LayoutSvc', LayoutSvc
