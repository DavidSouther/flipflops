Path = require "path"
config = require '../config'
root = config.root

vendors =
    prefix: Path.join global.root, 'bower_components'
    js: [
        'angular/angular.js'
        'angular-ui-router/release/angular-ui-router.js'
        'angular-cookies/angular-cookies.js'
        # 'angular-resource/angular-resource.js'
        'angular-sanitize/angular-sanitize.js'
        'angular-animate/angular-animate.js'
        'marked/lib/marked.js'
        'highlightjs/highlight.pack.js'
        # 'angular-ui/build/**/*'
        # 'bootstrap/dist/js/bootstrap.js'
        # 'angular-bootstrap/ui-bootstrap-tpl.js'
        # 'angular-bootstrap/ui-bootstrap.js'
    ]

    css: [
        # 'bootstrap/dist/css/*.css'
        # 'bootstrop/dist/fonts/*.css'
        # 'css-social-buttons/css/*.css'
        # '!**/*.min.css'
        'highlightjs/styles/tomorrow.css'
    ]

    stylus: [
        'bootstrap/dist/css/bootstrap.css'
        'bootstrap/dist/css/bootstrap-theme.css'
    ]

st = require('stassets')({
    root
    vendors
    verbose: config.verbose or no
})

module.exports = st
