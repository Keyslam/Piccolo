local Piccolo = require('piccolo')
local Service = Piccolo.service

---@class StubService : Piccolo.Service
---@overload fun(): StubService
local StubService = Service('StubService') ---@type StubService

return StubService
