local Piccolo = require('piccolo')
local Component = Piccolo.component

---@class StubComponent : Piccolo.Component
---@field wasEnabled boolean
---@field wasDisabled boolean
---@field wasDestroyed boolean
---@overload fun(entity: Piccolo.Entity): StubComponent
local StubComponent = Component('StubComponent') ---@type StubComponent

function StubComponent:new(...)
    self:super(...)

    self.wasEnabled = false
    self.wasDisabled = false
    self.wasDestroyed = false
end

function StubComponent:onEnable()
    self.wasEnabled = true
end

function StubComponent:onDisable()
    self.wasDisabled = true
end

function StubComponent:onDestroy()
    self.wasDestroyed = true
end

function StubComponent:onEvent() end

function StubComponent:resetSpies()
    self.wasEnabled = false
    self.wasDisabled = false
    self.wasDestroyed = false
end

return StubComponent
