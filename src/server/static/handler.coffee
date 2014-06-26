config = require process.env.CONFIG_FILE or '../../site/config'

console.log 'Path is', "#{config.source}/assets"

module.exports = require('st')({
    path: "#{config.source}/assets"
    url: '/assets'
    passthrough: yes
})
