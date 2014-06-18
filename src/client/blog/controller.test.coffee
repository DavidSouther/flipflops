describe 'Blog', ->
    describe 'Controller', ->
        beforeEach module 'flipflops.blog.controller'

        it 'sets basic metadata', inject ($controller)->
            BlogCtrl = $controller('BlogCtrl')
            BlogCtrl.title.should.equal 'FlipFlops', 'Titleg'
            BlogCtrl.author.should.equal 'David Souther (DEVELOPMENT)', 'Author'
