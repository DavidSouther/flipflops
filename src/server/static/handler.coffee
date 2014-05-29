Path = require "path"
client = Path.join global.root, 'build', 'client'
st = require('st')(client)

handler = (req, res, next)->
    if req.path.match /\.(html|css|js|map|coffee|png|svg|json|gif|ttf)$/
        # Statically serve .{asset} files
        st(req, res, next)
    else if req.path.match /^\/(api|auth)/
        next()
    else
        # Serve the index
        res.sendfile Path.join client, 'index.html'

module.exports = handler
