local StubComponent = require('spec.stubs.stub-component')
local StubEntity = require('spec.stubs.stub-entity')

describe('Component', function()
    it('should be initialized as enabled', function()
        local component = StubComponent(StubEntity)

        assert.is_true(component:isEnabled())
    end)

    describe('emit', function()
        it('should pass events to the entity', function()
            local component = StubComponent(StubEntity)
            local emitSpy = spy.on(StubEntity, 'emit')

            component:emit('onEvent', 'arg1', 'arg2')

            assert.spy(emitSpy).called_with(StubEntity, 'onEvent', 'arg1', 'arg2')
        end)
    end)

    describe('emitScene', function()
        it('should propagate to entity', function()
            local component = StubComponent(StubEntity)
            local emitSpy = spy.on(StubEntity, 'emitScene')

            component:emitScene('onEvent', 'arg1', 'arg2')

            assert.spy(emitSpy).called_with(StubEntity, 'onEvent', 'arg1', 'arg2')
        end)
    end)

    describe('getEntity', function()
        it("should return the component's entity", function()
            local component = StubComponent(StubEntity)

            assert.equal(StubEntity, component:getEntity())
        end)
    end)

    describe('enable', function()
        it('should enable a disabled component', function()
            local component = StubComponent(StubEntity)
            component:disable()

            component:enable()

            assert.is_true(component:isEnabled())
        end)

        it('should invoke onEnable for a disabled component', function()
            local component = StubComponent(StubEntity)
            component:disable()

            component:enable()

            assert.is_true(component.wasEnabled)
        end)

        it('should do nothing for an enabled component', function()
            local component = StubComponent(StubEntity)
            component:enable()
            component:resetSpies()

            component:enable()

            assert.is_false(component.wasEnabled)
        end)
    end)

    describe('disable', function()
        it('should disable an enabled component', function()
            local component = StubComponent(StubEntity)
            component:enable()

            component:disable()

            assert.is_true(component:isDisabled())
        end)

        it('should invoke onDisable for an enabled component', function()
            local component = StubComponent(StubEntity)
            component:enable()

            component:disable()

            assert.is_true(component.wasDisabled)
        end)

        it('should do nothing for a disabled component', function()
            local component = StubComponent(StubEntity)
            component:disable()
            component:resetSpies()

            component:disable()

            assert.is_false(component.wasDisabled)
        end)
    end)

    describe('isEnabled', function()
        it('should return true when the component is enabled', function()
            local component = StubComponent(StubEntity)
            component:enable()

            local isEnabled = component:isEnabled()
            assert.is_true(isEnabled)
        end)

        it('should return false when the component is disabled', function()
            local component = StubComponent(StubEntity)
            component:disable()

            local isEnabled = component:isEnabled()
            assert.is_false(isEnabled)
        end)
    end)

    describe('isDisabled', function()
        it('should return true when the component is disabled', function()
            local component = StubComponent(StubEntity)
            component:disable()

            local isDisabled = component:isDisabled()
            assert.is_true(isDisabled)
        end)

        it('should return false when the component is enabled', function()
            local component = StubComponent(StubEntity)
            component:enable()

            local isDisabled = component:isDisabled()
            assert.is_false(isDisabled)
        end)
    end)
end)
