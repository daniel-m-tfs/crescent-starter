-- src/auth/routes/auth.lua
-- Rotas para Auth
-- prefix definido em auth/init.lua

local controller = require("src.auth.controllers.auth")

return function(app, prefix)
    prefix = prefix or "/auth"
    
    -- CRUD completo
    app:post(prefix .. "/login", function(ctx)
        return controller:login(ctx)
    end)
    
    app:post(prefix .. "/register", function(ctx)
        return controller:register(ctx)
    end)
    
    app:post(prefix .. "/refresh-token", function(ctx)
        return controller:refresh_token(ctx)
    end)
    
end
