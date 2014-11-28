Path = require 'path'
TemplateWatcher = require 'stassets/lib/Watchers/Template'
AssetWatcher = require 'stassets/lib/Watchers/Asset'

class LayoutWatcher extends TemplateWatcher
    constructor: (@config)->
        @config = JSON.parse JSON.stringify @config
        super(@config)

    pattern: -> AssetWatcher::pattern.call @, [ "**/layout.jade" ]
    matches: (path)-> path in ['/layouts.js']
    getShortPath: (path)-> '/' + super(path).replace(/\/layout$/, '')
    getModuleName: (shortPath)-> 'flipflops.layouts.templates'

    wrap: (path, content, code)->
        layout = super(path, content, code)
        layout.content = layout.content.replace(
            "angular.module('flipflops.layouts.templates', [])",
            "angular.module('flipflops.layouts.templates')"
        )
        layout

    concat: (_)->
        _.unshift
            content: "angular.module('#{@getModuleName()}', []);\n"
            sourceMap: null
        super _

module.exports = LayoutWatcher
