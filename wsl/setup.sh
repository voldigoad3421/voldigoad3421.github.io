#!/bin/bash

# WSL Development Environment Setup Script
# Sets up Node.js, npm, Git, and essential development tools

set -e  # Exit on error

echo "🚀 Starting WSL Development Environment Setup..."

# Colors for output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Update package lists
echo -e "${BLUE}📦 Updating package lists...${NC}"
sudo apt update

# Install essential build tools
echo -e "${BLUE}🔧 Installing build essentials...${NC}"
sudo apt install -y build-essential curl git wget

# Install Node.js via nvm
echo -e "${BLUE}📦 Installing Node.js via nvm...${NC}"
if [ ! -d "$HOME/.nvm" ]; then
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash

    # Load nvm
    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

    # Install latest LTS
    nvm install --lts
    nvm use --lts

    echo -e "${GREEN}✅ Node.js installed successfully${NC}"
else
    echo -e "${YELLOW}⚠️  nvm already installed, skipping...${NC}"
fi

# Verify installations
echo -e "${BLUE}🔍 Verifying installations...${NC}"
echo "Node version: $(node --version 2>/dev/null || echo 'Not found - reload shell')"
echo "npm version: $(npm --version 2>/dev/null || echo 'Not found - reload shell')"
echo "Git version: $(git --version)"

# Optional: Install Oh My Zsh
read -p "$(echo -e ${YELLOW}Would you like to install Oh My Zsh for a better terminal? [y/N]:${NC} )" -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    if [ ! -d "$HOME/.oh-my-zsh" ]; then
        sudo apt install -y zsh
        sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
        echo -e "${GREEN}✅ Oh My Zsh installed${NC}"
    else
        echo -e "${YELLOW}⚠️  Oh My Zsh already installed${NC}"
    fi
fi

echo -e "${GREEN}✅ Setup complete!${NC}"
echo -e "${YELLOW}⚠️  Important: Run 'source ~/.bashrc' or restart your terminal to load nvm${NC}"
