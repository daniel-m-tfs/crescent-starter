-- src/users/services/users.lua
-- Service para lógica de negócio de Users

local UsersService = {}
local User = require("src.users.models.users")

function UsersService:getAll()
    return User:all()
end

function UsersService:getById(id)
    return User:find(id)
end

function UsersService:create(body)
   return User:create(body)
end

function UsersService:update(id, body)
    local user = User:find(id)
    if user then
        user:update(body)
        return user
    end
    return nil
end

function UsersService:delete(id)
    local user = User:find(id)
    if user then
        user:delete()
        return true
    end
    return false
end

return UsersService
