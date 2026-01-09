# 🌙 Crescent Starter

Official starter template for Crescent Framework.

This is a ready-to-use template for building web applications with [Crescent Framework](https://github.com/daniel-m-tfs/crescent-framework).

## 🚀 Quick Start

```bash
# Clone this starter template
git clone https://github.com/daniel-m-tfs/crescent-starter.git myapp
cd myapp

# Install dependencies
lit install

# Install CLI globally (enables `crescent` command)
./install-cli.sh

# Configure environment
cp .env.example .env
nano .env  # Edit with your settings

# Run server
crescent server
# or
luvit app.lua
```

Server will be running at `http://localhost:3000` 🎉

## 📦 Setup

### 1. Install Luvit

```bash
# macOS / Linux / WSL
curl -L https://github.com/luvit/lit/raw/master/get-lit.sh | sh

# Or via Homebrew (macOS)
brew install luvit
```

This installs both `luvit` and `lit` (package manager).

### 2. Clone and Setup

```bash
git clone https://github.com/daniel-m-tfs/crescent-starter.git myapp
cd myapp

# Install dependencies (framework + MySQL driver)
lit install

# Install CLI globally (optional but recommended)
./install-cli.sh

# Configure environment
cp .env.example .env
nano .env  # Edit with your database credentials
```

### 3. Run Migrations (Optional)

```bash
crescent migrate
# or
luvit bootstrap.lua migrate
```

### 4. Start Server

```bash
# Option 1: Using CLI (if installed globally)
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
