local Piccolo = require('piccolo')
local Scene = Piccolo.scene
local StubService = require('spec.stubs.stub-service')

describe('Scene', function()
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

    describe('hasService', function()
        it('should return true if service exists', function()
            local scene = Scene(StubService)

            local hasService = scene:hasService(StubService)

            assert.is_true(hasService)
        end)

        it('should return false if service is missing', function()
            local scene = Scene()

            local hasService = scene:hasService(StubService)

            assert.is_false(hasService)
        end)
    end)

    describe('getService', function()
        it('should return the service instance if it exists', function()
            local scene = Scene(StubService)

            local service = scene:getService(StubService)

            assert.is_not_nil(service)
        end)

        it('should throw an error when service is missing', function()
            local scene = Scene()

            local ok, err = pcall(function()
                local _ = scene:getService(StubService)
            end)

            assert.is_false(ok)
            assert.matches('service ".*" not found', err or '')
        end)
    end)

    describe('tryGetService', function()
        it('should return the service instance if it exists', function()
            local scene = Scene(StubService)

            local service = scene:tryGetService(StubService)

            assert.is_not_nil(service)
        end)

        it('should return nil when service is missing', function()
            local scene = Scene()

            local service = scene:tryGetService(StubService)

            assert.is_nil(service)
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
