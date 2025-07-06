local PATH = (...):gsub('%.[^%.]+$', '')

---@module "piccolo.vendor.class"
local Class = require(PATH .. '.vendor.class')

---@class Piccolo.Scene : Piccolo.Class
local Scene = Class({ name = 'Piccolo.Scene' })

function Scene:new() end

return Scene
