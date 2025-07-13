local Piccolo = require('piccolo')
local Entity = Piccolo.entity
local StubScene = require('spec.stubs.stub-scene')
local StubComponent = require('spec.stubs.stub-component')

describe('Entity', function()
    it('should be instantiated with no components', function()
        local entity = Entity(StubScene)

        local hasComponent = entity:hasComponent(StubComponent)
        assert.is_false(hasComponent)
    end)

    describe('addComponent', function()
        it('should add a new component', function()
            local entity = Entity(StubScene)

            local component = entity:addComponent(StubComponent)

            assert.is_not_nil(component)
            assert.is_true(component:is(StubComponent))
        end)

        it('should throw if component already exists', function()
            local entity = Entity(StubScene)
            entity:addComponent(StubComponent)

            local ok, err = pcall(function()
                entity:addComponent(StubComponent)
            end)

            assert.is_false(ok)
            assert.matches("Component '.*' already exists", err or '')
        end)
    end)

    describe('tryAddComponent', function()
        it('should add a new component', function()
            local entity = Entity(StubScene)

            local component = entity:tryAddComponent(StubComponent)

            assert.is_not_nil(component)
            ---@cast component -nil
            assert.is_true(component:is(StubComponent))
        end)

        it('should do nothing if component already exists', function()
            local entity = Entity(StubScene)
            entity:addComponent(StubComponent)

            local component = entity:tryAddComponent(StubComponent)
            local currentComponent = entity:getComponent(StubComponent)

            assert.is_nil(component)
            assert.are_not_equal(currentComponent, component)
        end)
    end)

    describe('addOrReplaceComponent', function()
        it('should replace existing component', function()
            local entity = Entity(StubScene)
            entity:addComponent(StubComponent)

            local component = entity:addOrReplaceComponent(StubComponent)

            assert.is_not_nil(component)
            assert.is_true(component:is(StubComponent))
        end)

        it('should destroy existing component', function()
            local entity = Entity(StubScene)
            local oldComponent = entity:addComponent(StubComponent)

            local _ = entity:addOrReplaceComponent(StubComponent)

            assert.is_true(oldComponent.wasDestroyed)
        end)
    end)

    describe('hasComponent', function()
        it('should return true if component exists', function()
            local entity = Entity(StubScene)
            entity:addComponent(StubComponent)

            local hasComponent = entity:hasComponent(StubComponent)

            assert.is_true(hasComponent)
        end)

        it('should return false if component is missing', function()
            local entity = Entity(StubScene)

            local hasComponent = entity:hasComponent(StubComponent)

            assert.is_false(hasComponent)
        end)
    end)

    describe('getComponent', function()
        it('should return the component if it exists', function()
            local entity = Entity(StubScene)
            local addedComponent = entity:addComponent(StubComponent)

            local component = entity:getComponent(StubComponent)

            assert.equal(addedComponent, component)
        end)

        it('should throw if the component is missing', function()
            local entity = Entity(StubScene)

            local ok, err = pcall(function()
                local _ = entity:getComponent(StubComponent)
            end)

            assert.is_false(ok)
            assert.matches('component ".*" not found', err or '')
        end)
    end)

    describe('tryGetComponent', function()
        it('should return the component if it exists', function()
            local entity = Entity(StubScene)
            local addedComponent = entity:addComponent(StubComponent)

            local component = entity:tryGetComponent(StubComponent)

            assert.equal(addedComponent, component)
        end)

        it('should return nil when component is missing', function()
            local entity = Entity(StubScene)

            local component = entity:tryGetComponent(StubComponent)

            assert.is_nil(component)
        end)
    end)

    describe('removeComponent', function()
        it('should remove a existing component', function()
            local entity = Entity(StubScene)
            entity:addComponent(StubComponent)

            entity:removeComponent(StubComponent)

            local hasComponent = entity:hasComponent(StubComponent)
            assert.is_false(hasComponent)
        end)

        it('should throw a error is component does not exist', function()
            local entity = Entity(StubScene)

            local ok, err = pcall(function()
                entity:removeComponent(StubComponent)
            end)

            assert.is_false(ok)
            assert.matches('component ".*" not found', err or '')
        end)
    end)

    describe('tryRemoveComponent', function()
        it('should remove a existing component if it exists', function()
            local entity = Entity(StubScene)
            entity:addComponent(StubComponent)

            local didRemove = entity:tryRemoveComponent(StubComponent)

            local hasComponent = entity:hasComponent(StubComponent)
            assert.is_true(didRemove)
            assert.is_false(hasComponent)
        end)

        it('should do nothing if the component does not exist', function()
            local entity = Entity(StubScene)

            local didRemove = entity:tryRemoveComponent(StubComponent)

            assert.is_false(didRemove)
        end)
    end)

    describe('emit', function()
        it('should call handlers on components', function()
            local entity = Entity(StubScene)
            local stubComponent = entity:addComponent(StubComponent)
            local handlerSpy = spy.on(stubComponent, 'onEvent')

            entity:emit('onEvent', 'arg1', 'arg2')

            assert.spy(handlerSpy).called_with(stubComponent, 'arg1', 'arg2')
        end)
    end)

    describe('emitScene', function()
        it('should propagate events to scene', function()
            local entity = Entity(StubScene)
            local emitSpy = spy.on(entity.scene, 'emit')

            entity:emitScene('onEvent', 'arg1', 'arg2')

            assert.spy(emitSpy).called_with(StubScene, 'onEvent', 'arg1', 'arg2')
        end)
    end)

    describe('getScene', function()
        it('should return the scene the entity was created with', function()
            local entity = Entity(StubScene)

            local scene = entity:getScene()
            assert.equal(StubScene, scene)
        end)
    end)
end)
