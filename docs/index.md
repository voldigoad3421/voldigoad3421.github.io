---
layout: home

hero:
  name: Quick Scripts
  text: IT Administration Tools
  tagline: Comprehensive documentation for setup scripts and system administration
  image:
    src: /logo.svg
    alt: Quick Scripts
  actions:
    - theme: brand
      text: Get Started with WSL
      link: /wsl/
    - theme: alt
      text: ⚡ Quick Install
      link: https://voldigoad3421.github.io

features:
  - icon: 🐧
    title: WSL Development
    details: Complete development environment with Node.js, npm, Git, and build tools. One-line install, zero configuration required.
    link: /wsl/
    linkText: Read WSL Docs →

  - icon: 🪟
    title: Windows Server
    details: PowerShell scripts for Windows Server configuration, Active Directory, and Group Policy automation.
    link: /windows/
    linkText: Coming Soon

  - icon: 📦
    title: MDT Automation
    details: Microsoft Deployment Toolkit scripts for automated OS deployment and configuration.
    link: /mdt/
    linkText: Coming Soon

  - icon: 🖥️
    title: Hyper-V Management
    details: Virtual machine provisioning, snapshot management, and network configuration scripts.
    link: /hyperv/
    linkText: Coming Soon

  - icon: 🔧
    title: Sysadmin Tools
    details: Daily system administration utilities, monitoring scripts, and maintenance automation.
    link: /sysadmin/
    linkText: Coming Soon

  - icon: 🌐
    title: Network Config
    details: Network troubleshooting, DHCP/DNS configuration, and connectivity testing tools.
    link: /networking/
    linkText: Coming Soon
---

<style>
.vp-doc {
  max-width: 1200px !important;
}
</style>

## 🚀 Quick Start

Get up and running in seconds with our one-line installers:

::: code-group

```bash [WSL/Linux]
curl -fsSL voldigoad3421.github.io/wsl/setup.sh | bash
```

```powershell [Windows]
# Coming soon
irm voldigoad3421.github.io/windows/setup.ps1 | iex
```

:::

## 💡 Why Use These Scripts?

<div class="tip custom-block" style="padding-top: 8px">

### Production-Ready
All scripts are tested in real IT environments and follow industry best practices.

</div>

<div class="info custom-block" style="padding-top: 8px">

### Zero Configuration
Intelligent defaults that just work. Customize only if you need to.

</div>

<div class="warning custom-block" style="padding-top: 8px">

### Idempotent & Safe
Run scripts multiple times safely. They detect existing installations and skip unnecessary steps.

</div>

## 📚 Documentation Structure

Each script category includes:

- **Quick Install** - One-line command for immediate use
- **Installation Guide** - Step-by-step setup instructions
- **Configuration** - Customization options and settings
- **Troubleshooting** - Common issues and solutions
- **Best Practices** - Tips for optimal usage

## 🎯 Featured: WSL Setup

Our most popular script! Set up a complete development environment:

```bash
# What gets installed:
✓ Node.js (via nvm)
✓ npm & package managers
✓ Git version control
✓ Build essentials (gcc, make, etc.)
✓ Oh My Zsh (optional, beautiful terminal)
```

**[Get Started with WSL →](/wsl/)**

## 🔗 Quick Links

- [WSL Installation Guide](/wsl/installation) - Detailed setup walkthrough
- [Node.js Configuration](/wsl/nodejs) - Version management with nvm
- [Terminal Customization](/wsl/terminal) - Make it beautiful
- [Troubleshooting](/wsl/troubleshooting) - Fix common issues

## 🤝 Need Help?

- 📖 Browse the documentation using the sidebar
- 🔍 Use the search bar (press `/` or `Ctrl+K`)
- 💬 Open an issue on [GitHub](https://github.com/voldigoad3421/voldigoad3421.github.io/issues)
- ⚡ Try [Quick Install mode](https://voldigoad3421.github.io) for visual navigation

---

<div style="text-align: center; padding: 40px 0; opacity: 0.7;">
  <p><strong>Built with ❤️ for IT Administrators</strong></p>
  <p style="font-size: 0.9em;">Making infrastructure setup fast, reliable, and reproducible</p>
</div>
