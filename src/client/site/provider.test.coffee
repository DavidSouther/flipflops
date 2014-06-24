describe 'Site', ->
    describe 'Service', ->
        beforeEach module 'flipflops.site', 'flipflops.site.mock'

        $httpBackend = null
        beforeEach -> inject (_$httpBackend_)->$httpBackend = _$httpBackend_
        beforeEach -> inject (SiteMock)-> httpBackend SiteMock

        it 'sets basic metadata', inject (Site)->
            $httpBackend.flush()
            Site.title.should.equal 'FlipFlops', 'Title'
            Site.author.should.equal 'David Souther (DEVELOPMENT)', 'Author'
