-- src/auth/init.lua
-- Módulo Auth - Agrupa controllers, services e rotas

local Module = {}

function Module.register(app)
    -- Registra rotas do módulo
    local routes = require("src.auth.routes.auth")
    routes(app, "/auth")
    
    print("✓ Módulo Auth carregado")
end

return Module
