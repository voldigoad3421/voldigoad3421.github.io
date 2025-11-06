# Installation Guide

Complete step-by-step guide to installing the WSL development environment.

## One-Line Install (Recommended)

The fastest way to get started:

```bash
curl -fsSL voldigoad3421.github.io/wsl/setup.sh | bash
```

This will:
1. Update package lists
2. Install build essentials
3. Install Node.js via nvm
4. Optionally install Oh My Zsh

## Manual Installation

If you prefer to install components individually:

### 1. Update System

```bash
sudo apt update
sudo apt upgrade -y
```

### 2. Install Build Tools

```bash
sudo apt install -y build-essential curl git wget
```

### 3. Install Node.js

```bash
curl -fsSL voldigoad3421.github.io/wsl/nodejs.sh | bash
```

Or manually:

```bash
# Install nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash

# Load nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# Install Node.js LTS
nvm install --lts
nvm use --lts
```

### 4. Install Oh My Zsh (Optional)

```bash
curl -fsSL voldigoad3421.github.io/wsl/terminal.sh | bash
```

## Verify Installation

After installation, verify everything works:

```bash
# Check Node.js
node --version
# Should output: v20.x.x (or latest LTS)

# Check npm
npm --version
# Should output: 10.x.x (or latest)

# Check Git
git --version
# Should output: git version 2.x.x
```

## Post-Installation

### Load nvm in Current Shell

If you see "command not found: nvm", run:

```bash
source ~/.bashrc
```

Or close and reopen your terminal.

### Set Default Node Version

```bash
nvm alias default node
```

### Update npm

```bash
npm install -g npm@latest
```

## What's Installed Where

- **nvm**: `~/.nvm/`
- **Node.js**: `~/.nvm/versions/node/`
- **npm global packages**: `~/.nvm/versions/node/vX.X.X/lib/node_modules/`
- **Oh My Zsh**: `~/.oh-my-zsh/`

## Next Steps

- [Node.js Setup](/wsl/nodejs) - Configure Node.js and npm
- [Terminal Setup](/wsl/terminal) - Customize your terminal
- [Troubleshooting](/wsl/troubleshooting) - Fix common issues
