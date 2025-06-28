local PATH = (...):gsub('%.[^%.]+$', '')

---@module "piccolo.vendor.class"
local Class = require(PATH .. '.vendor.class')

---@class Piccolo.Entity
local Entity = Class({ name = 'Piccolo.Entity' })

function Entity:addComponent(componentClass, ...) end
function Entity:hasComponent(componentClass) end
function Entity:getComponent(componentClass) end
function Entity:tryGetComponent(componentClass) end

return Entity
