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
            $scope.site.title.should.equal 'FlipFlops', 'Title'
            $scope.site.author.should.equal 'David Souther (DEVELOPMENT)', 'Author'
