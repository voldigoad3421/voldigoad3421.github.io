# Terminal Setup

Transform your terminal into a beautiful, productive workspace with Oh My Zsh.

## Quick Install

```bash
curl -fsSL voldigoad3421.github.io/wsl/terminal.sh | bash
```

## What You Get

- **Zsh** - Powerful shell with advanced features
- **Oh My Zsh** - Plugin and theme framework
- **Syntax highlighting** - Colored commands
- **Auto-suggestions** - Command completion
- **Git integration** - Branch info in prompt

## Manual Installation

### Install Zsh

```bash
sudo apt update
sudo apt install -y zsh
```

### Install Oh My Zsh

```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

### Make Zsh Default

```bash
chsh -s $(which zsh)
```

## Customization

### Themes

Edit `~/.zshrc`:

```bash
# Change theme
ZSH_THEME="agnoster"
```

Popular themes:
- `robbyrussell` - Default, minimal
- `agnoster` - Beautiful powerline theme
- `powerlevel10k` - Highly customizable
- `spaceship` - Minimalistic

Apply changes:
```bash
source ~/.zshrc
```

### Plugins

Edit `~/.zshrc`:

```bash
plugins=(
  git
  node
  npm
  docker
  kubectl
  history
  copyfile
  colored-man-pages
)
```

Useful plugins:
- `git` - Git shortcuts and info
- `node` / `npm` - Node.js completions
- `docker` - Docker completions
- `zsh-autosuggestions` - Command suggestions
- `zsh-syntax-highlighting` - Syntax coloring

### Install Additional Plugins

```bash
# Auto-suggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# Syntax highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```

Then add to plugins in `~/.zshrc`:
```bash
plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
)
```

## Color Schemes

### Enable Colors

Add to `~/.zshrc`:

```bash
# Colorful ls
alias ls='ls --color=auto'
alias ll='ls -lah --color=auto'
alias la='ls -A --color=auto'

# Colorful grep
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
```

### Windows Terminal Integration

If using Windows Terminal, customize appearance:

1. Open Windows Terminal settings
2. Select your WSL profile
3. Choose a color scheme:
   - One Half Dark
   - Solarized Dark
   - Dracula

## Fonts

For powerline themes like agnoster, install a Nerd Font:

1. Download from [Nerd Fonts](https://www.nerdfonts.com/)
2. Recommended: FiraCode Nerd Font or MesloLGS NF
3. Install in Windows
4. Set in Windows Terminal settings

## Aliases

Add useful shortcuts to `~/.zshrc`:

```bash
# Navigation
alias ..='cd ..'
alias ...='cd ../..'
alias ~='cd ~'

# Development
alias gs='git status'
alias gp='git pull'
alias gps='git push'
alias nrd='npm run dev'
alias nrb='npm run build'

# System
alias update='sudo apt update && sudo apt upgrade -y'
alias cls='clear'
```

## Productivity Tips

### Command History Search

Press `Ctrl+R` and start typing to search history.

### Tab Completion

Press `Tab` for auto-completion. Press twice for options.

### Directory Navigation

```bash
# Jump to recent directories
cd -

# Use directory stack
pushd /path
popd
```

## Next Steps

- [Troubleshooting](/wsl/troubleshooting) - Fix common issues
- [Back to Overview](/wsl/) - WSL setup overview
