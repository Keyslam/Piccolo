local PATH = (...):gsub('%.[^%.]+$', '')

---@module "piccolo.vendor.class"
local Class = require(PATH .. '.vendor.class')

---@class Piccolo.Component : Class
---@field private _isEnabled boolean
---@field private _entity Piccolo.Entity
---@overload fun(): Piccolo.Component
local Component = Class({ name = 'Piccolo.Component' })

function Component:new(...)
    self._isEnabled = true
    self._entity = select(select('#', ...), ...)
end

function Component:getEntity()
    return self._entity
end

function Component:enable()
    if self:isEnabled() then
        return
    end

    self._isEnabled = true
    self:onEnable()
end

function Component:disable()
    if self:isDisabled() then
        return
    end

    self._isEnabled = false
    self:onDisable()
end

---@return boolean
---@nodiscard
function Component:isEnabled()
    return self._isEnabled
end

---@return boolean
---@nodiscard
function Component:isDisabled()
    return not self:isEnabled()
end

function Component:onEnable() end
function Component:onDisable() end
function Component:onDestroy() end

return function(name)
    return Class({
        name = name,
        extends = Component,
    })
end
