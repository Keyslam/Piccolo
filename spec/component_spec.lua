local Piccolo = require('piccolo')
local Component = Piccolo.component

local StubComponent = Component('StubComponent')

describe('Component', function()
    it('should have the class type "Piccolo.Component"', function()
        assert.is(StubComponent.__super['__type'], 'Piccolo.Component')
    end)

    it('should be instantiable', function()
        local component = StubComponent()

        assert.is_not_nil(component)
    end)
end)
