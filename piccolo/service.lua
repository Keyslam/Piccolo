local PATH = (...):gsub('%.[^%.]+$', '')

---@module "piccolo.vendor.class"
local Class = require(PATH .. '.vendor.class')

---@class Piccolo.Service : Piccolo.Class
---@field private scene Piccolo.Scene
---@overload fun(scene: Piccolo.Scene): Piccolo.Service
local Service = Class({ name = 'Piccolo.Service' })

function Service:new(scene)
    self.scene = scene
end

---@return Piccolo.Scene
---@nodiscard
function Service:getScene()
    return self.scene
end

return function(name)
    return Class({
        name = name,
        extends = Service,
    })
end
