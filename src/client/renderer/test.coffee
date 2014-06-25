describe 'Renderer', ->
    beforeEach module 'flipflops.renderer'

    it 'is able to render', (done)-> inject (Renderer, $rootScope)->
        Renderer.render('# Markdown')
        .then (rendered)->
            rendered.should.match /<h1.*Markdown<\/h1>/
            done()
        .catch done
        $rootScope.$apply()
