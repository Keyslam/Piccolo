local Piccolo = require('piccolo')
local Component = Piccolo.component

---@class StubComponent : Piccolo.Component
---@field wasDestroyed boolean
local StubComponent = Component('StubComponent')

function StubComponent:new(...)
    self:super(...)

    self.wasDestroyed = false
end

function StubComponent:onDestroy()
    self.wasDestroyed = true
end

return StubComponent
