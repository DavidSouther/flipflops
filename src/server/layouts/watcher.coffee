Path = require 'path'
TemplateWatcher = require 'stassets/lib/Watchers/Template'
AssetWatcher = require 'stassets/lib/Watchers/Asset'

class LayoutWatcher extends TemplateWatcher
    constructor: (@config)->
        @config = JSON.parse JSON.stringify @config
        super(@config)

    pattern: -> AssetWatcher::pattern.call @, [ "**/layout.jade" ]
    matches: (path)-> path in ['/layouts.js']
    getShortPath: (path)-> super(path).replace(/\/layout$/, '')
    getModuleName: (shortPath)-> 'flipflops.layouts.templates'
    wrap: (path, content)->
        shortPath = @getShortPath path
        module = @getModuleName shortPath

        """
        angular.module('#{module}')
        .run(function($templateCache){
            $templateCache.put('/#{shortPath}', '#{@escapeContent(content)}');
        });
        """

    concat: (_)->
        _.unshift "angular.module('#{@getModuleName()}', []);\n"
        _.join('\n')

module.exports = LayoutWatcher
