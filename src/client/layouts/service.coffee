class LayoutSvc
    constructor: ->
        @active = 'default'

    setActiveLayout: (layout = 'default')->
        console.log "Page setting layout to #{layout}"
        @active = layout

angular.module('flipflops.layout.service', [

]).service 'LayoutSvc', LayoutSvc
