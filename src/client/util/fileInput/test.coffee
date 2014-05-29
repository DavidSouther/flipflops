describe 'File Input', ->
    beforeEach module 'teals.scavenger.fileInput'

    it 'renders', ->
        $element = render 'file-input'
        $element.attr('type').should.equal 'file'
