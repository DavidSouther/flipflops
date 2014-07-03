readline = require 'readline'
Q = require 'q'
fs = require 'fs'

rl = readline.createInterface({
    input: process.stdin
    output: process.stdout
})

question = (prompt)->
    d = Q.defer()
    rl.question prompt, (answer)->
        d.resolve answer
    d.promise

config =
    title: 'NO TITLE'
    subtitle: 'NONE'
    author: 'Nemo'
    copyright: (new Date()).getYear()

module.exports = ->
    Q(yes)
    .then(->question 'What is the site title? ')
    .then((_)->config.title = _ or config.title)
    .then(->question 'What is the site subtitle? ')
    .then((_)->config.subtitle = _ or config.subtitle)
    .then(->question 'Who is the site author? ')
    .then((_)->config.author = _ or config.author)
    .then(->question 'When is the site copyright? ')
    .then((_)->config.copyright = _ or config.copyright)
    .then ->
        path = "#{process.env.CONFIG_FILE}.js"
        content = """
module.exports = {
    source: __dirname,
    site: {
        title: '#{config.title}',
        subtitle: '#{config.subtitle}',
        author: '#{config.author}',
        copyright: '#{config.copyright}'
    }
};
        """
        console.log 'Writing output', config

        fs.writeFileSync path, content

    .then(->console.log 'Config written!')
    .then(-> rl.close())
    .catch((_)-> console.log "There was an error!", _)
