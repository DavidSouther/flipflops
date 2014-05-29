describe 'Scavenger Main', ->
    beforeEach ->
        module 'flipflops'

    it 'should load a module', inject ($state)->
        # state.includes('')
        should.exist $state
