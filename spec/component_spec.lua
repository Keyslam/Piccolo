local Piccolo = require('piccolo')
local Entity = Piccolo.entity
local Component = Piccolo.component

local StubComponent = Component('StubComponent')

describe('Component', function()
    it('should have the class type "Piccolo.Component"', function()
        assert.is(StubComponent.__super['__type'], 'Piccolo.Component')
    end)

    describe('getEntity', function()
        it("should return the component's entity", function()
            local entity = Entity()
            local component = StubComponent(entity)

            assert.equal(entity, component:getEntity())
        end)
    end)
end)
