# Node.js Setup

Detailed guide for Node.js configuration and version management with nvm.

## Quick Install

```bash
curl -fsSL voldigoad3421.github.io/wsl/nodejs.sh | bash
```

## Using nvm (Node Version Manager)

### Why nvm?

nvm allows you to:
- Install multiple Node.js versions
- Switch between versions instantly
- Test projects on different Node versions
- Isolate projects with different Node requirements

### Basic Commands

```bash
# Install latest LTS
nvm install --lts

# Install specific version
nvm install 18.17.0

# List installed versions
nvm list

# Switch to a version
nvm use 20

# Set default version
nvm alias default 20

# Check current version
nvm current
```

## Version Management

### Installing Multiple Versions

```bash
# Install Node 18, 20, and 21
nvm install 18
nvm install 20
nvm install 21

# List all installed
nvm list
```

### Switching Versions

```bash
# Use Node 20
nvm use 20

# Verify
node --version
```

### Project-Specific Versions

Create `.nvmrc` in your project:

```bash
echo "20.9.0" > .nvmrc
```

Then use:

```bash
nvm use
# Automatically uses version from .nvmrc
```

## npm Configuration

### Update npm

```bash
npm install -g npm@latest
```

### Global Packages

Install commonly used global packages:

```bash
# Development tools
npm install -g typescript
npm install -g ts-node
npm install -g nodemon

# Linters and formatters
npm install -g eslint
npm install -g prettier

# Package managers
npm install -g pnpm
npm install -g yarn
```

### View Global Packages

```bash
npm list -g --depth=0
```

### npm Configuration

```bash
# Set npm registry (if needed)
npm config set registry https://registry.npmjs.org/

# View all config
npm config list

# Set default init values
npm config set init-author-name "Your Name"
npm config set init-license "MIT"
```

## Performance Tips

### Enable npm Cache

```bash
npm config set cache ~/.npm-cache --global
```

### Use pnpm for Faster Installs

```bash
npm install -g pnpm

# Use pnpm instead of npm
pnpm install
pnpm add package-name
```

## Uninstalling Node.js

### Remove Specific Version

```bash
nvm uninstall 18
```

### Remove nvm Completely

```bash
rm -rf ~/.nvm
# Remove nvm lines from ~/.bashrc
```

## Troubleshooting

### nvm command not found

```bash
source ~/.bashrc
```

### npm permissions issues

Use nvm - it installs packages to your home directory, avoiding permission issues.

### Slow npm installs

Try pnpm:
```bash
npm install -g pnpm
```

## Next Steps

- [Terminal Setup](/wsl/terminal) - Make your terminal beautiful
- [Troubleshooting](/wsl/troubleshooting) - Common issues
