local PATH = (...):gsub('%.[^%.]+$', '')

---@module "piccolo.vendor.class"
local Class = require(PATH .. '.vendor.class')

---@class Piccolo.Entity : Piccolo.Class
---@field scene Piccolo.Scene
---@field components table<Piccolo.Component, Piccolo.Component>
---@overload fun(scene: Piccolo.Scene): Piccolo.Entity
local Entity = Class({ name = 'Piccolo.Entity' })

function Entity:new(scene)
    self.scene = scene
    self.components = {}
end

---@generic T : Piccolo.Component
---@param componentClass T
---@param ... any
---@return T
function Entity:addComponent(componentClass, ...)
    ---@type Piccolo.Component | nil
    local oldComponent = self:tryGetComponent(componentClass)

    if oldComponent ~= nil then
        local name = componentClass['__type'] or tostring(componentClass)
        local message = ("Component '%s' already exists"):format(name)
        error(message, 2)
    end

    ---@type Piccolo.Component
    local component = componentClass(..., self)
    self.components[componentClass] = component

    return component
end

---@generic T : Piccolo.Component
---@param componentClass T
---@param ... any
---@return T | nil
function Entity:tryAddComponent(componentClass, ...)
    if self:hasComponent(componentClass) then
        return nil
    end

    return self:addComponent(componentClass, ...)
end

---@generic T : Piccolo.Component
---@param componentClass T
---@param ... any
---@return T
function Entity:addOrReplaceComponent(componentClass, ...)
    ---@type Piccolo.Component | nil
    local oldComponent = self:tryGetComponent(componentClass)

    if oldComponent ~= nil then
        self:removeComponent(componentClass)
    end

    return self:addComponent(componentClass, ...)
end

---@generic T : Piccolo.Component
---@param componentClass T
---@nodiscard
function Entity:hasComponent(componentClass)
    return self:tryGetComponent(componentClass) ~= nil
end

---@generic T : Piccolo.Component
---@param componentClass T
---@return T
---@nodiscard
function Entity:getComponent(componentClass)
    ---@type Piccolo.Component | nil
    local component = self:tryGetComponent(componentClass)

    if component == nil then
        local name = componentClass['__type'] or tostring(componentClass)
        local message = ('component "%s" not found'):format(name)

        error(message, 2)
    end

    return component
end

---@generic T : Piccolo.Component
---@param componentClass T
---@return T | nil
---@nodiscard
function Entity:tryGetComponent(componentClass)
    local component = self.components[componentClass]
    return component
end

---@generic T : Piccolo.Component
---@param componentClass T
function Entity:removeComponent(componentClass)
    local component = self:getComponent(componentClass)

    self.components[componentClass] = nil
    component:onDestroy()
end

---@generic T : Piccolo.Component
---@param componentClass T
---@return boolean
function Entity:tryRemoveComponent(componentClass)
    if not self:hasComponent(componentClass) then
        return false
    end

    self:removeComponent(componentClass)

    return true
end

---@param event string
---@param ... any
---@return self
function Entity:emit(event, ...)
    local handlerName = event

    for _, component in pairs(self.components) do
        local handler = component[handlerName]
        if handler ~= nil then
            handler(component, ...)
        end
    end

    return self
end

---@param event string
---@param ... any
---@return self
function Entity:emitScene(event, ...)
    self:getScene():emit(event, ...)

    return self
end

---@return Piccolo.Scene
---@nodiscard
function Entity:getScene()
    return self.scene
end

return Entity
