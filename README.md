# 🌙 Crescent Starter

Official starter template for Crescent Framework.

This is a ready-to-use template for building web applications with [Crescent Framework](https://github.com/daniel-m-tfs/crescent-framework).

## 🚀 Quick Start

### Option 1: Use Crescent CLI (Recommended)

```bash
# Install Crescent Framework
lit install daniel-m-tfs/crescent-framework

# Create new project
crescent new myapp
cd myapp

# Configure and run
cp .env.example .env
nano .env  # Edit with your settings
crescent server
```

### Option 2: Clone This Template

```bash
git clone https://github.com/daniel-m-tfs/crescent-starter.git myapp
cd myapp
rm -rf .git
git init
```

## 📦 Setup

### 1. Install Luvit

```bash
# macOS / Linux / WSL
curl -L https://github.com/luvit/lit/raw/master/get-lit.sh | sh

# Or via Homebrew (macOS)
brew install luvit
```

This installs both `luvit` and `lit` (package manager).

### 2. Install MySQL Driver (Optional)

Only needed if using database:

```bash
lit install creationix/mysql
```

### 3. Configure Environment

```bash
cp .env.example .env
nano .env  # Edit with your database credentials
```

### 4. Run Migrations (Optional)

```bash
luvit bootstrap.lua migrate
```

### 5. Start Server

```bash
# Option 1: Using CLI
crescent server

# Option 2: Direct
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
# If using global crescent command
crescent make:module Product
crescent make:controller Product
crescent make:migration create_products_table
crescent migrate

# Or using luvit directly
luvit crescent-cli.lua make:module Product
luvit crescent-cli.lua make:controller Product
luvit crescent-cli.lua make:service Product
luvit crescent-cli.lua make:model Product
luvit crescent-cli.lua make:routes Product
luvit crescent-cli.lua make:migration create_products_table
luvit crescent-cli.lua migrate
```

## 📚 Documentation

- **Framework:** https://github.com/daniel-m-tfs/crescent-framework
- **Installation Guide:** [Framework INSTALLATION.md](https://github.com/daniel-m-tfs/crescent-framework/blob/main/INSTALLATION.md)
- **Database Guide:** [Framework DATABASE.md](https://github.com/daniel-m-tfs/crescent-framework/blob/main/DATABASE.md)
- **Security Guide:** [Framework SECURITY.md](https://github.com/daniel-m-tfs/crescent-framework/blob/main/SECURITY.md)
- **Website:** https://crescent.tyne.com.br

## 🤝 Contributing

Found a bug or have a suggestion? Please open an issue!

## 📄 License

MIT License - see [LICENSE](LICENSE) file for details.
