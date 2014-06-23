describe 'Blog', ->
    describe 'Controller', ->
        beforeEach module(
            'flipflops.blog.controller'
            'flipflops.blog.controller.mock'
        )

        $httpBackend = null
        beforeEach -> inject (_$httpBackend_)->$httpBackend = _$httpBackend_

        it 'sets basic metadata', inject ($controller, SiteMock)->
            httpBackend SiteMock
            BlogCtrl = $controller('BlogCtrl')
            $httpBackend.flush()
            BlogCtrl.title.should.equal 'FlipFlops', 'Title'
            BlogCtrl.author.should.equal 'David Souther (DEVELOPMENT)', 'Author'
