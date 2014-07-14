Q = require 'q'
Path = require 'path'

readline = require 'readline'
rl = readline.createInterface({
    input: process.stdin
    output: process.stdout
})

question = (prompt)->
    d = Q.defer()
    rl.question prompt, (answer)->
        d.resolve answer
    d.promise

create = (what)->
    unless create[what]?
        console.error "Can't create a `#{what}`."
        process.exit(1)
    create[what]()

create.post = ->
    Q(yes)
    .then(question('Post Title?'))
    .then (title)->
        slug = title
            .replace(/\s+/, '-')
            .replace(/\W/, '')
            .toLowerCase()
        path = "#{}"

create.page = ->


module.exports =
