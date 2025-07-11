local Piccolo = require('piccolo')
local Service = Piccolo.service

describe('Service', function()
    it('should be instantiated', function()
        local service = Service()
        assert.is_not_nil(service)
    end)
end)
