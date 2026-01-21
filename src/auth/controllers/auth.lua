-- src/auth/controllers/auth.lua
-- Controller para Auth
local service = require("src.auth.services.auth")
local AuthController = {}

function AuthController:login(ctx)
    local result = service:login(ctx.body or {})

    if result.error then
        return ctx.json(result.code, { error = result.error })
    end

    return ctx.json(200, {
        user = result.user,
        tokens = result.tokens
    })
end

function AuthController:register(ctx)
    local body = ctx.body or {}
    local result = service:register(body)

    if result.error then
        return ctx.json(result.code, { error = result.error })
    end

    return ctx.json(201, result)
end

function AuthController:refresh_token(ctx)

    local result = service:refresh_token(ctx.body.refresh_token)

    if result.error then
        return ctx.json(result.code, { error = result.error })
    end
    
    return ctx.json(201, result)
end

return AuthController
