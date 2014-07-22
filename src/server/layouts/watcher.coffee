config = require '../config'
Path = require 'path'
TemplateWatcher = require 'stassets/lib/Watchers/Template'

root = [Path.join global.root, 'src', 'client', 'layouts']
root.concat config.layouts if config.layouts

class LayoutWatcher extends TemplateWatcher
    constructor: (@config)->
        @config = JSON.parse JSON.stringify @config
        @config.root = root
        super(@config)

    pattern: ->
        super [
            "layouts/**/template.jade"
        ]
    matches: (path)-> path in ['/layouts.js']
    getShortPath: (path)-> "layouts/#{super(path)}"
    getModuleName: (shortPath)-> 'flipflops.layouts.templates'
    wrap: (path, content)->
        shortPath = @getShortPath path
        module = @getModuleName shortPath

        """
        angular.module('#{module}')
        .run(function($templateCache){
            $templateCache.put('#{shortPath}', '#{@escapeContent(content)}');
        });
        """
    concat: (_)->
        _.unshift "angular.module('#{@getModuleName()}', []);\n"
        _.join('\n')

module.exports = LayoutWatcher
