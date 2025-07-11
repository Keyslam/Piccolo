local Piccolo = require('piccolo')
local Scene = Piccolo.scene

describe('scene', function()
    it('should be instantiated', function()
        local scene = Scene()

        assert.is_not_nil(scene)
    end)

    describe('spawn', function()
        it('should create a entity for the scene', function()
            local scene = Scene()
            local entity = scene:spawn()

            assert.equal(scene, entity:getScene())
        end)
    end)

    describe('getEntities', function()
        it('should return all entities in the scene', function()
            local scene = Scene()
            local entity1 = scene:spawn()
            local entity2 = scene:spawn()

            local entities = scene:getEntities()
            assert.equal(entity1, entities[1])
            assert.equal(entity2, entities[2])
        end)

        it('should return the passed table', function()
            local scene = Scene()

            local out = {}
            local entities = scene:getEntities(out)

            assert.equal(out, entities)
        end)
    end)
end)
