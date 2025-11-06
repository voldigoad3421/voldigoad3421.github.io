# Troubleshooting

Common issues and solutions for WSL development setup.

## Node.js Issues

### nvm: command not found

**Problem:** After installation, `nvm` command doesn't work.

**Solution:**
```bash
# Load nvm in current shell
source ~/.bashrc

# Or restart your terminal
```

**Permanent fix:** Make sure these lines are in `~/.bashrc`:
```bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
```

### node: command not found (but nvm works)

**Problem:** nvm is installed but Node.js isn't.

**Solution:**
```bash
# Install Node.js
nvm install --lts

# Set as default
nvm alias default node
```

### npm permission errors (EACCES)

**Problem:** Permission denied when installing global packages.

**Solution:** With nvm, this shouldn't happen. If it does:

```bash
# Verify nvm is managing Node.js
which node
# Should show: /home/username/.nvm/versions/node/...

# If not, reinstall Node.js via nvm
nvm install --lts
nvm use --lts
```

### Slow npm installs

**Solutions:**

1. **Use pnpm:**
```bash
npm install -g pnpm
pnpm install  # Much faster
```

2. **Clear npm cache:**
```bash
npm cache clean --force
```

3. **Check network:**
```bash
npm config set registry https://registry.npmjs.org/
```

## Terminal Issues

### Oh My Zsh not loading

**Problem:** Installed but Zsh doesn't start.

**Solution:**
```bash
# Make Zsh default shell
chsh -s $(which zsh)

# Log out and back in
```

### Broken characters/symbols in prompt

**Problem:** Powerline symbols show as boxes or question marks.

**Solution:**

1. Install a Nerd Font (Windows side)
2. Set it in Windows Terminal:
   - Settings → Profile → Appearance → Font face
   - Choose: FiraCode Nerd Font or MesloLGS NF

### Theme not changing

**Problem:** Changed ZSH_THEME but nothing happens.

**Solution:**
```bash
# Apply changes
source ~/.zshrc

# Or restart terminal
```

### Colors not working

**Problem:** Terminal looks plain, no colors.

**Solution:**

Add to `~/.zshrc`:
```bash
export TERM=xterm-256color
alias ls='ls --color=auto'
```

Then reload:
```bash
source ~/.zshrc
```

## WSL Issues

### WSL won't start

**Problem:** WSL fails to launch.

**Solution:**

1. Check WSL is enabled:
```powershell
# In PowerShell (as Admin)
dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart
```

2. Restart Windows

3. Set WSL 2 as default:
```powershell
wsl --set-default-version 2
```

### Can't access Windows files

**Problem:** Need to access C: drive.

**Solution:**

Windows drives are mounted at `/mnt/`:
```bash
cd /mnt/c/Users/YourName
```

### Slow file operations

**Problem:** Operations on `/mnt/c/` are slow.

**Solution:**

Store code in WSL filesystem for better performance:
```bash
# Store projects here (fast)
~/projects/

# Not here (slow)
/mnt/c/Users/YourName/projects/
```

### DNS not working

**Problem:** Can't resolve domain names.

**Solution:**

Create/edit `/etc/wsl.conf`:
```bash
[network]
generateResolvConf = false
```

Then create `/etc/resolv.conf`:
```bash
nameserver 8.8.8.8
nameserver 8.8.4.4
```

Restart WSL:
```powershell
wsl --shutdown
```

## Installation Issues

### apt update fails

**Problem:** Can't update package lists.

**Solution:**

1. Check internet:
```bash
ping google.com
```

2. Update repositories:
```bash
sudo apt update --fix-missing
```

3. Try different mirror:
```bash
sudo nano /etc/apt/sources.list
# Change mirror if needed
```

### Build tools installation fails

**Problem:** build-essential won't install.

**Solution:**

```bash
# Update first
sudo apt update

# Install dependencies
sudo apt install -y gcc make

# Then try again
sudo apt install -y build-essential
```

### curl command not found

**Problem:** curl isn't installed.

**Solution:**
```bash
sudo apt update
sudo apt install -y curl wget
```

## Getting Help

Still stuck? Try:

1. **Check logs:**
```bash
# Check system logs
dmesg | tail

# Check WSL logs (Windows side)
# Event Viewer → Windows Logs → Application
```

2. **Reset WSL:**
```powershell
# In PowerShell
wsl --shutdown
wsl --unregister Ubuntu  # WARNING: Deletes everything
wsl --install
```

3. **Reinstall script:**
```bash
# Run setup again (it's idempotent)
curl -fsSL voldigoad3421.github.io/wsl/setup.sh | bash
```

## Resources

- [WSL Documentation](https://docs.microsoft.com/en-us/windows/wsl/)
- [nvm GitHub](https://github.com/nvm-sh/nvm)
- [Oh My Zsh](https://ohmyz.sh/)
- [Node.js Docs](https://nodejs.org/docs/)
