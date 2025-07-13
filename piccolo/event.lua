local PATH = (...):gsub('%.[^%.]+$', '')

---@module "piccolo.vendor.class"
local Class = require(PATH .. '.vendor.class')

---@class Piccolo.Event : Piccolo.Class
---@field private kind 'entity' | 'scene'
---@overload fun(kind: 'entity' | 'scene'): Piccolo.Event
local Event = Class({ name = 'Piccolo.Event' })

function Event:new(kind)
    self.kind = kind
end

---@return 'entity' | 'scene'
---@nodiscard
function Event:getKind()
    return self.kind
end

return Event
