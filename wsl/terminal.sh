#!/bin/bash

# Setup a beautiful, colorful terminal with Oh My Zsh

set -e

echo "🎨 Setting up beautiful terminal..."

# Install Zsh
if ! command -v zsh &> /dev/null; then
    echo "📦 Installing Zsh..."
    sudo apt update
    sudo apt install -y zsh
else
    echo "✅ Zsh already installed"
fi

# Install Oh My Zsh
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    echo "📦 Installing Oh My Zsh..."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

    # Set a nice theme
    sed -i 's/ZSH_THEME="robbyrussell"/ZSH_THEME="agnoster"/g' ~/.zshrc

    echo "✅ Oh My Zsh installed with agnoster theme"
else
    echo "✅ Oh My Zsh already installed"
fi

# Install useful plugins
echo "📦 Enabling useful plugins..."
sed -i 's/plugins=(git)/plugins=(git node npm docker)/g' ~/.zshrc

# Add colored ls
if ! grep -q "alias ls='ls --color=auto'" ~/.zshrc; then
    echo "alias ls='ls --color=auto'" >> ~/.zshrc
fi

echo "✅ Terminal setup complete!"
echo ""
echo "🎯 To use Zsh, run: zsh"
echo "🎯 To make Zsh default: chsh -s $(which zsh)"
