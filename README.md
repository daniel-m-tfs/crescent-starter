# 🌙 Crescent Starter

Official starter template for Crescent Framework.

This is a ready-to-use template for building web applications with [Crescent Framework](https://github.com/daniel-m-tfs/crescent-framework).

## 🚀 Quick Start

### Option 1: Use as Template (Recommended)

Click the "Use this template" button above, or:

```bash
git clone https://github.com/daniel-m-tfs/crescent-starter.git myapp
cd myapp
```

### Option 2: Use Crescent CLI

```bash
luarocks install crescent
crescent new myapp
cd myapp
```

## 📦 Installation

```bash
# Install Luvit (if not installed)
brew install luvit  # macOS
# or
curl -L https://github.com/luvit/lit/raw/master/get-lit.sh | sh  # Linux

# Install dependencies
luarocks install crescent
lit install creationix/mysql

# Configure environment
cp .env.example .env
nano .env  # Edit with your database credentials

# Run migrations
luvit bootstrap.lua migrate

# Start server
luvit app.lua
```

Server will be running at `http://localhost:3000` 🎉

## 📁 Project Structure

```
myapp/
├── app.lua              # Entry point
├── bootstrap.lua        # Migration runner
├── config/
│   ├── development.lua  # Dev configuration
│   └── production.lua   # Prod configuration
├── src/                 # Your modules
│   └── users/           # Example user module
│       ├── controllers/
│       ├── services/
│       ├── models/
│       └── routes/
├── migrations/          # Database migrations
├── public/             # Static files
└── tests/              # Tests
```

## 🎨 Generate Code

```bash
# Create a complete CRUD module
luvit crescent-cli.lua make:module Product

# Create individual components
luvit crescent-cli.lua make:controller Product
luvit crescent-cli.lua make:service Product
luvit crescent-cli.lua make:model Product
luvit crescent-cli.lua make:routes Product

# Create migration
luvit crescent-cli.lua make:migration create_products_table

# Run migrations
luvit crescent-cli.lua migrate
```

## 📚 Documentation

- **Framework:** https://github.com/daniel-m-tfs/crescent-framework
- **Docs:** https://crescent.tyne.com.br
- **LuaRocks:** https://luarocks.org/modules/crescent

## 🤝 Contributing

Found a bug or have a suggestion? Please open an issue!

## 📄 License

MIT License - see [LICENSE](LICENSE) file for details.
