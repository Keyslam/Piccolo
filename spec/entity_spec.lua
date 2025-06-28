local Piccolo = require('piccolo')
local Entity = Piccolo.entity

describe('Entity', function()
    it('should have the class type "Piccolo.Entity"', function()
        assert.is(Entity['__type'], 'Piccolo.Entity')
    end)

    it('should be instantiable', function()
        local entity = Entity()

        assert.is_not_nil(entity)
    end)
end)
