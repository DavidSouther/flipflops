describe 'Site', ->
    describe 'Controller', ->
        beforeEach module 'flipflops.site.controller', 'flipflops.site.mock'

        $httpBackend = null
        beforeEach -> inject (_$httpBackend_)->$httpBackend = _$httpBackend_
        beforeEach -> inject (SiteMock)-> httpBackend SiteMock

        it 'sets basic metadata', inject ($controller, $rootScope)->
            $scope = $rootScope.$new()
            $controller 'Site', {$scope}
            $httpBackend.flush()

            site = $scope.site
            site.title.should.equal 'FlipFlops', 'Title'
            site.author.should.equal 'David Souther (DEVELOPMENT)', 'Author'
