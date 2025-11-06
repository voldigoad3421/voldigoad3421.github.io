#!/bin/bash

# Install Node.js via nvm (Node Version Manager)
# Allows easy switching between Node.js versions

set -e

echo "🚀 Installing Node.js via nvm..."

# Install nvm
if [ ! -d "$HOME/.nvm" ]; then
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash

    # Load nvm for current session
    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
else
    echo "✅ nvm already installed"
    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
fi

# Install latest LTS version
echo "📦 Installing Node.js LTS..."
nvm install --lts
nvm use --lts

# Set default
nvm alias default node

echo "✅ Node.js installation complete!"
echo "Node version: $(node --version)"
echo "npm version: $(npm --version)"
echo ""
echo "⚠️  Run 'source ~/.bashrc' to load nvm in your current shell"
