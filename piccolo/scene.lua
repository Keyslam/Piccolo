local PATH = (...):gsub('%.[^%.]+$', '')

---@module "piccolo.vendor.class"
local Class = require(PATH .. '.vendor.class')

---@module "piccolo.entity"
local Entity = require(PATH .. '.entity')

---@class Piccolo.Scene : Piccolo.Class
---@field private services table<Piccolo.Service, Piccolo.Service>
---@field private entities table<number, Piccolo.Entity>
---@overload fun(...: table<number, Piccolo.Service>): Piccolo.Scene
local Scene = Class({ name = 'Piccolo.Scene' })

function Scene:new(...)
    self.services = {}
    self.entities = {}

    for i = 1, select('#', ...) do
        local serviceClass = select(i, ...)
        local service = serviceClass(self)

        self.services[serviceClass] = service
    end
end

function Scene:spawn()
    local entity = Entity(self)

    table.insert(self.entities, entity)

    return entity
end

---@generic T : Piccolo.Service
---@param serviceClass T
---@return boolean
---@nodiscard
function Scene:hasService(serviceClass)
    return self:tryGetService(serviceClass) ~= nil
end

---@generic T : Piccolo.Service
---@param serviceClass T
---@return T
---@nodiscard
function Scene:getService(serviceClass)
    ---@type Piccolo.Service | nil
    local service = self:tryGetService(serviceClass)

    if service == nil then
        local name = serviceClass['__type'] or tostring(serviceClass)
        local message = ('service "%s" not found'):format(name)

        error(message, 2)
    end

    return service
end

---@generic T : Piccolo.Service
---@param serviceClass T
---@return T | nil
---@nodiscard
function Scene:tryGetService(serviceClass)
    local service = self.services[serviceClass]
    return service
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
