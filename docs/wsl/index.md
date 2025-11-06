# WSL Development Setup

Complete guide for setting up a development environment in Windows Subsystem for Linux (WSL).

## What Gets Installed

Our setup script installs everything you need for modern development:

- **Node.js** (via nvm) - JavaScript runtime with version management
- **npm** - Node package manager
- **Git** - Version control system
- **Build essentials** - gcc, make, and other compilation tools
- **Oh My Zsh** (optional) - Beautiful, functional terminal

## Quick Install

```bash
curl -fsSL voldigoad3421.github.io/wsl/setup.sh | bash
```

::: tip
After installation, run `source ~/.bashrc` or restart your terminal to load nvm.
:::

## What's Next?

- [Installation Guide](/wsl/installation) - Step-by-step setup instructions
- [Node.js Setup](/wsl/nodejs) - Detailed Node.js configuration
- [Terminal Setup](/wsl/terminal) - Make your terminal beautiful
- [Troubleshooting](/wsl/troubleshooting) - Common issues and solutions

## Prerequisites

- Windows 10 version 2004+ or Windows 11
- WSL2 installed (Ubuntu or Debian-based distribution)
- Internet connection

## Features

✅ **Zero configuration** - Works out of the box
✅ **Version management** - Switch Node.js versions easily with nvm
✅ **Optional theming** - Choose to install Oh My Zsh during setup
✅ **Idempotent** - Safe to run multiple times
✅ **Colorful output** - Clear status messages during installation
