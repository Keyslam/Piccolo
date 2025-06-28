local Piccolo = require('piccolo')

describe('Piccolo', function()
    it('should have a version', function()
        assert.is_string(Piccolo._VERSION)
    end)

    it('should have a description', function()
        assert.is_string(Piccolo._DESCRIPTION)
    end)

    it('should have a license', function()
        assert.is_string(Piccolo._LICENSE)
    end)
end)
