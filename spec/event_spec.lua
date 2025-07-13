local Piccolo = require('piccolo')
local Event = Piccolo.event

describe('Event', function()
    it('should return the correct kind', function()
        local eventEntity = Event('entity')
        local eventScene = Event('scene')

        assert.equal('entity', eventEntity:getKind())
        assert.equal('scene', eventScene:getKind())
    end)
end)
