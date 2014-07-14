AssetWatcher = require 'stassets/lib/Watchers/Asset'
yaml = require 'js-yaml'

class SiteWatcher extends AssetWatcher
    constructor: (@config)->
        unless @config.source instanceof Array
            @config.source = [ @config.source ]
        @config.root = @config.source

        @config.moreSep = '<!-- more -->'

        site = @config.site = @config.site or {}
        site.title = site.title or 'FlipFlops Site'
        site.subtitle = site.subtitle or 'Go to the beach.'
        site.author = site.author or "#{site.title} Admin"

        super()

    pattern: ->
        super [
            "**/index.markdown"
            "**/index.md"
            "**/README.md"
        ]

    matches: (path)-> path in ['/site.json']
    type: -> "application/json"

    render: (_, filename)->
        obj = {}
        filename = @pathpart filename
        obj[filename] = @configFile @parseFile _, filename
        obj

    parseFile: (_, path)->
        middle = 0
        front = ''
        if _.indexOf('---\n') is 0
            middle = _.indexOf '---\n', 4
            front = _.substr 4, middle - 4 # middle is the length
        middle += 5 if middle > 0
        body = _.substr middle
        front = try
            yaml.safeLoad(front)
        catch err
            {}
            # console.warn "YAMLException, trying frontmatter defaults."
            # console.warn err
        front or= {} # YAML of '' is null
        front.path = path
        {front, body}

    # Do work on _.front, filling in defaults
    configFile: (_)->
        f = _.front
        f.title = f.title or @parseTitle f.path
        f.author = f.author or @config.site.author
        if f.path.indexOf '/posts/' is 0
            f.date = f.date or new Date f.path.substr(
                '/posts/'.length, 'YYYY/mm/dd'.length
            )
        if more = _.body.indexOf(@config.moreSep) >= 0
            _.intro = _.body.substr(0, more - @config.moreSep.length)
        _

    parseTitle: (path)->
        return 'Home' if path is '/README.md'
        sep = '/'
        prefixLen = 1
        index = path.indexOf '/index.m'
        if path.indexOf('/posts/') is 0
            # Assume /posts/YYYY/mm/dd/title-with-hyphens/index.md
            prefixLen = '/posts/YYYY/mm/dd/'.length
            sep = '-'
        else if path.indexOf('/pages/') is 0
            # Assume /pages/title/as/path/index.md
            prefixLen = '/pages/'.length
            sep = '/'
        path.substr(prefixLen, index - prefixLen).replace(sep, '') or 'Home'

    concat: (_)->
        files = {}
        copyAll = (obj, _)->
            obj[path] = file for own path, file of _
            obj
        _.reduce copyAll, files

        site: @config.site
        files: files

module.exports = SiteWatcher
