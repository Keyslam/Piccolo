local PATH = (...):gsub('%.[^%.]+$', '')

---@module "piccolo.vendor.class"
local Class = require(PATH .. '.vendor.class')

---@class Piccolo.Service : Piccolo.Class
---@overload fun(): Piccolo.Service
local Service = Class({ name = 'Piccolo.Service' })

function Service:new() end

return Service
