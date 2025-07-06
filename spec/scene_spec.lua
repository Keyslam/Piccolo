local Piccolo = require('piccolo')
local Scene = Piccolo.scene

describe('scene', function()
    it('should be instantiated', function()
        local scene = Scene()

        assert.is_not_nil(scene)
    end)
end)
