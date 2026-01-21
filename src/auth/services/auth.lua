-- src/auth/services/auth.lua
-- Service para lógica de negócio de Auth

local AuthService = {}
local auth = require('crescent.middleware.auth')
local hash = require("crescent.utils.hash")
local User = require("src.users.models.users")

function AuthService:login(body)
    
    -- Buscar usuário
    local user = User:where("email", body.email):first()
    
    if not user then
        return { error = "Credenciais inválidas", code = 401 }
    end
    
    -- Verificar senha
    if not hash.verify(body.password, user.password) then
        return { error = "Credenciais inválidas", code = 401 }
    end
    
    -- Gerar tokens
    local tokens = auth.generate_token_pair(user)
    
    return {
        user = {
            id = user.id,
            name = user.name,
            email = user.email
        },
        tokens = tokens
    }
end

function AuthService:register(data)
    
    local existing = User:where("email", data.email):first()
    if existing then
        return { error = "Email já está em uso", code = 400 }
    end

    if not data.email or not data.password then
        return { error = "Email e senha são obrigatórios", code = 400 }
    end
    
    local passwordHash = hash.encrypt(data.password)
    
    local user = User:create({
        name = data.name,
        email = data.email,
        password = passwordHash
    })
    
    local tokens = auth.generate_token_pair(user)
    
    return {
        user = {
            id = user.id,
            name = user.name,
            email = user.email
        },
        tokens = tokens
    }
end

function AuthService:refresh_token(refresh_token)

    -- Verificar refresh token
    local ok, payload = auth.verify_token(refresh_token)
    
    if not ok then
        return { error = "Token inválido ou expirado", code = 401 }
    end
    
    -- Buscar usuário
    local user = User:find(payload.user_id)
    
    if not user then
        return { error = "Usuário não encontrado", code = 404 }
    end
    
    -- Gerar novo access token
    local access_token = auth.generate_access_token({
        user_id = user.id,
        username = user.name,
        email = user.email
    })
    
    return {
        access_token = access_token,
        token_type = "Bearer",
        expires_in = 900
    }
end


return AuthService
