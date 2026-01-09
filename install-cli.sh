#!/usr/bin/env bash

# Crescent Starter - CLI Installation Script
# This script installs the `crescent` command globally from the local framework copy

set -e

echo "🌙 Installing Crescent CLI globally..."

# Check if crescent-cli.lua exists in the local copy
CLI_PATH="./crescent-cli.lua"

if [ ! -f "$CLI_PATH" ]; then
    # Try to find in deps (if installed via lit)
    if [ -f "./deps/crescent-framework/crescent-cli.lua" ]; then
        CLI_PATH="./deps/crescent-framework/crescent-cli.lua"
    else
        echo "❌ Error: crescent-cli.lua not found"
        echo "   Make sure you're in the crescent-starter directory"
        exit 1
    fi
fi

# Get absolute path
CLI_PATH="$(cd "$(dirname "$CLI_PATH")" && pwd)/$(basename "$CLI_PATH")"

# Create the wrapper script
WRAPPER_CONTENT="#!/usr/bin/env bash
# Crescent CLI - Auto-generated wrapper
exec luvit \"$CLI_PATH\" \"\$@\"
"

# Determine installation directory
INSTALL_DIR="/usr/local/bin"

if [ -w "$INSTALL_DIR" ]; then
    echo "$WRAPPER_CONTENT" > "$INSTALL_DIR/crescent"
    chmod +x "$INSTALL_DIR/crescent"
else
    echo "📝 $INSTALL_DIR is not writable. Using sudo..."
    echo "$WRAPPER_CONTENT" | sudo tee "$INSTALL_DIR/crescent" > /dev/null
    sudo chmod +x "$INSTALL_DIR/crescent"
fi

# Verify installation
if command -v crescent &> /dev/null; then
    echo "✅ Crescent CLI installed successfully!"
    echo "📍 Location: $INSTALL_DIR/crescent"
    echo "🔗 Points to: $CLI_PATH"
    echo ""
    echo "🚀 Try these commands:"
    echo "   crescent --help"
    echo "   crescent server"
    echo "   crescent make:controller users"
else
    echo "⚠️  Installation completed but 'crescent' command not found in PATH"
    echo "   Make sure $INSTALL_DIR is in your PATH"
fi
