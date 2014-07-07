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

        describe 'page', ->
            it 'generates good page indexes', inject (Site)->
                index = [
                    '/pages/01_chapter/index.md'
                    '/pages/01_chapter/01_section/index.markdown'
                    '/pages/01_chapter/02_section/index.md'
                    '/pages/02_chapter/index.md'
                    '/pages/02_chapter/01_section/index.md'
                    '/pages/02_chapter/02_section/index.md'
                ]

                $httpBackend.flush()
                Site.index.should.exist
                Site.index.should.have.property('pages')
                Site.index.pages.length.should.equal 6
                Site.index.pages.should.deep.equal index
