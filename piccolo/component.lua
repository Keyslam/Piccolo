local PATH = (...):gsub('%.[^%.]+$', '')

---@module "piccolo.vendor.class"
local Class = require(PATH .. '.vendor.class')

---@class Piccolo.Component
local Component = Class({ name = 'Piccolo.Component' })

function Component:enable() end
function Component:disable() end

function Component:onEnable() end
function Component:onDisable() end
function Component:onDestroy() end

return function(name)
    return Class({
        name = name,
        extends = Component,
    })
end
