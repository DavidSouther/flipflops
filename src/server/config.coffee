Path = require "path"
config = require process.env.CONFIG_FILE or '../site/config'

root = []
unless config.defaultTheme is no
    root.push Path.join global.root, 'src', 'client'
if config.themes
    for theme in config.themes
        root.push Path.join config.source, 'themes', theme

config.root = root

module.exports = config
