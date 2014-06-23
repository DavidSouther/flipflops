AssetWatcher = require 'stassets/lib/Watchers/Asset'

class SiteWatcher extends AssetWatcher
    constructor: (@config)->
        @config.source = require('path').normalize(
            @config.source or "#{__dirname}/../../site"
        )
        @pattern = [
            "#{@config.source}/**/index.markdown"
            "#{@config.source}/**/index.md"
        ]
        super()

    matches: (path)-> path in ['/site.json']
    type: -> "application/json"

    render: (_, filename)->
        obj = {}
        filename = filename.replace(@config.source, '')
        obj[filename] = _
        obj

    concat: (_)->
        files = {}
        copyAll = (obj, _)->
            obj[path] = file for own path, file of _
        _.reduce copyAll, files

        site: @config.site
        files: files

module.exports = SiteWatcher
