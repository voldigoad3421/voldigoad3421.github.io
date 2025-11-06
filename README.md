# Quick Scripts Hub

Central hub for fast access to IT administration scripts and tools with dual-mode interface.

🌐 **Live Site:** https://voldigoad3421.github.io

---

## 🎯 What This Hub Does

This repository serves as a **centralized landing page** and **documentation site** for all IT administration scripts. It provides:

1. **⚡ Deploy Mode** - Beautiful quick-access page for one-line installations
2. **📚 Documentation Mode** - Comprehensive VitePress-powered guides
3. **🔗 Short URLs** - Clean, memorable links for all scripts

## 🏗️ Architecture Overview

### Dual-Mode System

We use **URL-based routing** to provide two distinct user experiences:

| Mode | URL | Purpose | Technology |
|------|-----|---------|-----------|
| **Deploy Mode** | `/` (root) | Quick script access, visual navigation | Pure HTML/CSS |
| **Documentation Mode** | `/docs/` | Detailed guides, search, tutorials | VitePress |

**Why separate modes?**
- Different use cases: "I need it NOW" vs "How does this work?"
- Independent updates: Change docs without touching quick install page
- Performance: Deploy mode is instant (~10KB), docs load only when needed
- Bookmarkable: Each mode can be bookmarked separately

### Directory Structure

```
voldigoad3421.github.io/
├── index.html                    # Deploy Mode - Main landing page
├── wsl/                          # WSL quick access
│   ├── index.html               # WSL landing page
│   ├── setup.sh                 # Complete setup script
│   ├── nodejs.sh                # Node.js only
│   └── terminal.sh              # Terminal setup only
├── docs/                         # Documentation Mode
│   ├── .vitepress/
│   │   └── config.js            # VitePress configuration
│   ├── index.md                 # Docs homepage
│   ├── wsl/                     # WSL documentation
│   │   ├── index.md
│   │   ├── installation.md
│   │   ├── nodejs.md
│   │   ├── terminal.md
│   │   └── troubleshooting.md
│   ├── windows/                 # Windows docs (coming soon)
│   ├── mdt/                     # MDT docs (coming soon)
│   ├── hyperv/                  # Hyper-V docs (coming soon)
│   ├── sysadmin/                # Sysadmin docs (coming soon)
│   └── networking/              # Networking docs (coming soon)
├── .github/workflows/
│   └── deploy.yml               # Automatic deployment to GitHub Pages
├── package.json                 # VitePress dependencies
└── README.md                    # This file
```

### Navigation Between Modes

- **Deploy Mode → Docs:** Button in top-right corner "📚 Documentation →"
- **Docs → Deploy Mode:** Nav link "⚡ Quick Install"

## 📦 Available Script Categories

### 🐧 WSL (Active)
WSL development environment setup
- **Quick install:** `curl -fsSL voldigoad3421.github.io/wsl/setup.sh | bash`
- **Source repo:** [voldiwsldeploy](https://github.com/voldigoad3421/voldiwsldeploy)
- **Documentation:** [/docs/wsl/](https://voldigoad3421.github.io/docs/wsl/)

### 🪟 Windows (Coming Soon)
Windows server configuration and PowerShell utilities

### 📦 MDT (Coming Soon)
Microsoft Deployment Toolkit automation scripts

### 🖥️ Hyper-V (Coming Soon)
Hyper-V virtualization management

### 🔧 Sysadmin (Coming Soon)
System administration tools and utilities

### 🌐 Networking (Coming Soon)
Network configuration and troubleshooting scripts

## 🚀 How to Add a New Category

When you create a new script category (e.g., Windows, MDT), follow these steps:

### 1. Create Source Repository
```bash
# Create new repo for your scripts
gh repo create voldi-windows-scripts --private
```

### 2. Add to Deploy Mode

**Update `index.html`:** The card is already there, just change status from "Coming Soon" to "Active"

**Create category directory:**
```bash
mkdir windows
cd windows
```

**Add landing page `windows/index.html`:**
```html
<!-- Copy from wsl/index.html and modify -->
```

**Add scripts:**
```bash
cp ../path/to/your/setup-windows.ps1 setup.ps1
```

### 3. Add to Documentation Mode

**Create docs directory:**
```bash
mkdir docs/windows
```

**Add overview `docs/windows/index.md`:**
```markdown
# Windows Scripts

Quick setup scripts for Windows Server...

## Quick Install
```powershell
irm voldigoad3421.github.io/windows/setup.ps1 | iex
```
```

**Add detailed guides:**
```bash
docs/windows/installation.md
docs/windows/configuration.md
docs/windows/troubleshooting.md
```

**Update VitePress config `docs/.vitepress/config.js`:**
```javascript
nav: [
  // Add to nav
  { text: 'Windows', link: '/windows/' },
],

sidebar: {
  // Add sidebar
  '/windows/': [
    {
      text: 'Windows Scripts',
      items: [
        { text: 'Overview', link: '/windows/' },
        { text: 'Installation', link: '/windows/installation' },
      ]
    }
  ],
}
```

### 4. Commit and Push
```bash
git add .
git commit -m "Add Windows scripts and documentation"
git push
```

GitHub Actions will automatically deploy!

## 🔧 Development

### Local Development

**Test Deploy Mode:**
```bash
# Just open in browser
open index.html
```

**Test Documentation Mode:**
```bash
# Install dependencies
npm install

# Start dev server
npm run docs:dev
# Visit http://localhost:5173
```

**Build docs locally:**
```bash
npm run docs:build
npm run docs:preview
```

### Deployment

**Automatic:** Push to `main` branch triggers GitHub Actions workflow

**Manual:** Not needed - GitHub Actions handles everything

**Workflow:** `.github/workflows/deploy.yml`
1. Builds VitePress docs
2. Copies static files (index.html, scripts)
3. Deploys to GitHub Pages

## 📝 Design Philosophy

### Deploy Mode (index.html)
- **Visual-first:** Users see all options at a glance
- **Copy-paste ready:** One command to copy
- **Beautiful but simple:** Pure HTML/CSS, no frameworks
- **Instant load:** < 10KB total size
- **Mobile-friendly:** Responsive grid layout

### Documentation Mode (VitePress)
- **Content-first:** Long-form guides and tutorials
- **Searchable:** Built-in search across all docs
- **Dark/light mode:** Automatic theme switching
- **Markdown-based:** Easy to write and maintain
- **SEO-friendly:** Static HTML for search engines

## 🗂️ Branch Structure

| Branch | Purpose |
|--------|---------|
| `main` | Production - auto-deploys to GitHub Pages |
| `archive/original-hub` | Backup of original design before VitePress |

## 🔗 Related Repositories

- [voldiwsldeploy](https://github.com/voldigoad3421/voldiwsldeploy) - WSL setup scripts (source)
- [voldideploy](https://github.com/voldigoad3421/voldideploy) - Docker deployment manager

## 📚 Technical Stack

- **Deploy Mode:** HTML5, CSS3 (gradients, backdrop-filter, grid)
- **Documentation:** VitePress 1.x, Vue 3, Markdown
- **Deployment:** GitHub Actions, GitHub Pages
- **Package Manager:** npm

## 🎨 Design Credits

The beautiful gradient design uses:
- Purple gradient: `linear-gradient(135deg, #667eea 0%, #764ba2 100%)`
- Frosted glass: `backdrop-filter: blur(10px)` + `rgba` backgrounds
- Smooth animations: CSS transitions on hover
- Typography: System fonts (Segoe UI, -apple-system)

## 📄 License

ISC

---

**Need help?** Check the [documentation](https://voldigoad3421.github.io/docs) or open an issue.
