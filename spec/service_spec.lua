local StubService = require('spec.stubs.stub-service')
local StubScene = require('spec.stubs.stub-scene')

describe('Service', function()
    it('should be instantiated', function()
        local service = StubService(StubScene)
        assert.is_not_nil(service)
    end)

    describe('getScene', function()
        it('should return the scene the service was created with', function()
            local service = StubService(StubScene)

            local scene = service:getScene()
            assert.equal(StubScene, scene)
        end)
    end)
end)
