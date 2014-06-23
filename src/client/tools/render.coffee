toKeyVal = (attributes, separator = ' ')->
    ("#{key} = \"#{val}\"" for key, val of attributes)
        .join separator

if angular.mock
    window.render = angular.mock.render = (directive, data, attributes)->
        $element = null
        inject ($compile, $rootScope)->
            $scope = $rootScope.$new()
            $scope[key] = val for key, val of data
            attributes = toKeyVal attributes

            template = $compile("<div #{directive} #{attributes}></div>")
            $element = template($scope)

            try
                $scope.$digest()
            catch exception
                err = "Exception when rendering #{directive}"
                console.error err, exception
                throw exception
        $element

    window.httpBackend = angular.mock.httpBackend = (data, afterEach = ->)->
        inject ($httpBackend)->
            for path, val of data
                $httpBackend.whenGET(path).respond(200, val)
            afterEach ->
                $httpBackend.verifyNoOutstandingExpectation()
                $httpBackend.verifyNoOutstandingRequest()
