local PATH = (...):gsub('%.[^%.]+$', '')

---@module "piccolo.vendor.class"
local Class = require(PATH .. '.vendor.class')

---@module "piccolo.entity"
local Entity = require(PATH .. '.entity')

---@class Piccolo.Scene : Piccolo.Class
---@field private entities table<Piccolo.Entity>
---@overload fun(): Piccolo.Scene
local Scene = Class({ name = 'Piccolo.Scene' })

function Scene:new()
    self.entities = {}
end

function Scene:spawn()
    local entity = Entity(self)

    table.insert(self.entities, entity)

    return entity
end

---@param out table<Piccolo.Entity> | nil
---@return table<Piccolo.Entity>
function Scene:getEntities(out)
    out = out or {}

    for i, entity in ipairs(self.entities) do
        out[i] = entity
    end

    return out
end

return Scene
