# voldigoad3421.github.io - Central Script Hub & Documentation

## Project Overview

Central hub providing short URLs for deployment scripts and comprehensive documentation across multiple categories.

**Purpose:** One-stop shop for quick deploy scripts + detailed documentation

**Repository:** https://github.com/voldigoad3421/voldigoad3421.github.io (Public)

**Live Site:** https://voldigoad3421.github.io/

## Dual-Mode Architecture

This site operates in TWO distinct modes:

### Deploy Mode (Quick Install)
**URL:** https://voldigoad3421.github.io/
**Purpose:** Beautiful visual interface for one-line installers
**Tech:** Pure HTML + CSS with gradient animations

**Features:**
- Frosted glass UI with purple gradient theme
- Copy-to-clipboard code snippets
- Category cards (WSL, Windows, MDT, Hyper-V, etc.)
- Direct navigation to docs mode

**Design:**
- Purple gradient: `linear-gradient(135deg, #667eea 0%, #764ba2 100%)`
- Frosted glass effect: `backdrop-filter: blur(10px)`, `rgba(255, 255, 255, 0.1)`
- Responsive mobile-first design

### Doc Mode (Comprehensive Documentation)
**URL:** https://voldigoad3421.github.io/docs/
**Purpose:** Detailed guides and troubleshooting
**Tech:** VitePress (Vue-based static site generator)

**Features:**
- Full documentation for each script category
- Navigation sidebar with sections
- Search functionality
- Custom theme matching deploy mode colors
- Direct navigation back to quick install page

**Why Two Modes?**
- Different use cases (quick deploy vs. learning)
- Better bookmarking (separate URLs)
- Independent updates (HTML vs. VitePress)
- Faster loading for deploy mode (no framework overhead)

## Directory Structure

```
voldigoad3421.github.io/
├── index.html                # Deploy Mode - Landing page
├── wsl/                      # WSL setup scripts
│   ├── setup.sh             # setup-wsl-dev.sh from voldiwsldeploy
│   ├── nodejs.sh            # install-nodejs.sh
│   └── terminal.sh          # setup-terminal.sh
├── starwars/                # Easter egg prank page
│   └── index.html          # Middle finger emoji animation
├── docs/                    # Doc Mode - VitePress documentation
│   ├── .vitepress/
│   │   ├── config.js       # VitePress configuration
│   │   └── theme/
│   │       └── custom.css  # Custom styling (purple theme)
│   ├── index.md            # Docs homepage
│   └── wsl/                # WSL documentation
│       ├── index.md        # WSL overview
│       ├── installation.md
│       ├── nodejs.md
│       ├── terminal.md
│       └── troubleshooting.md
├── .github/
│   └── workflows/
│       └── deploy.yml      # GitHub Actions deployment
├── package.json            # VitePress dependencies
└── README.md               # Architecture documentation

```

## Short URLs

The hub provides short, memorable URLs for scripts across repos:

**WSL Scripts (from voldiwsldeploy repo):**
```bash
# Full setup
curl -fsSL voldigoad3421.github.io/wsl/setup.sh | bash

# Node.js only
curl -fsSL voldigoad3421.github.io/wsl/nodejs.sh | bash

# Terminal only
curl -fsSL voldigoad3421.github.io/wsl/terminal.sh | bash
```

**Documentation:**
```
https://voldigoad3421.github.io/docs/wsl/
```

## How to Add New Categories

### Step 1: Add Scripts
```bash
# Create category directory
mkdir windows/

# Copy scripts from source repo
cp ../source-repo/script.ps1 windows/install.ps1
```

### Step 2: Update Deploy Mode (index.html)
```html
<!-- Add new category card -->
<div class="category">
    <div class="category-icon">🪟</div>
    <h2>Windows Setup</h2>
    <p>PowerShell scripts for Windows configuration</p>
    <div class="script-links">
        <div class="script">
            <span class="script-name">Full Setup</span>
            <code class="code-block">
                irm voldigoad3421.github.io/windows/setup.ps1 | iex
            </code>
            <button onclick="copy(this, 'irm voldigoad3421.github.io/windows/setup.ps1 | iex')">Copy</button>
        </div>
    </div>
</div>
```

### Step 3: Add Documentation
```bash
# Create docs directory
mkdir docs/windows/

# Create markdown files
echo "# Windows Setup" > docs/windows/index.md
```

### Step 4: Update VitePress Config
```js
// docs/.vitepress/config.js
sidebar: {
  '/wsl/': [...],
  '/windows/': [
    {
      text: 'Windows',
      items: [
        { text: 'Overview', link: '/windows/' },
        { text: 'Installation', link: '/windows/installation' }
      ]
    }
  ]
}
```

### Step 5: Commit and Push
```bash
git add .
git commit -m "Add Windows setup scripts and documentation"
git push origin main
```

GitHub Actions will automatically deploy within 1-2 minutes.

## VitePress Configuration

### Config File: `docs/.vitepress/config.js`

```js
export default {
  title: 'voldigoad scripts',
  description: 'Setup scripts and documentation',
  base: '/docs/',  // Important: subdirectory deployment
  themeConfig: {
    nav: [
      { text: 'Home', link: '/' },
      { text: 'WSL', link: '/wsl/' },
      { text: '⚡ Quick Install', link: 'https://voldigoad3421.github.io/' }
    ],
    sidebar: {
      '/wsl/': [...]
    }
  }
}
```

**Key Settings:**
- `base: '/docs/'` - Deploys to subdirectory
- `nav` - Top navigation bar with link back to deploy mode
- `sidebar` - Category-specific navigation

### Custom Theme: `docs/.vitepress/theme/custom.css`

Matches deploy mode purple gradient:
```css
:root {
  --vp-c-brand: #667eea;
  --vp-c-brand-light: #764ba2;
  --vp-c-brand-lighter: #8b5cf6;
  --vp-c-brand-dark: #5a67d8;
  --vp-c-brand-darker: #4c51bf;
}
```

## GitHub Actions Deployment

### Workflow: `.github/workflows/deploy.yml`

**Triggers:** Push to main branch

**Steps:**
1. Checkout repository
2. Setup Node.js 20
3. Install dependencies (`npm ci`)
4. Build VitePress docs (`npm run docs:build`)
5. Create `_site` directory structure:
   - Copy `index.html` (deploy mode)
   - Copy script directories (`wsl/`, `starwars/`)
   - Copy built docs (`docs/.vitepress/dist` → `_site/docs`)
6. Upload artifact to GitHub Pages
7. Deploy to GitHub Pages

**Important:** Must include ALL static directories in copy step:
```yaml
- name: Create build directory structure
  run: |
    mkdir -p _site
    cp index.html _site/
    cp -r wsl _site/
    cp -r starwars _site/
    cp README.md _site/
    cp -r docs/.vitepress/dist _site/docs
```

**Permissions Required:**
```yaml
permissions:
  contents: read
  pages: write
  id-token: write
```

## Development Commands

```bash
# Install dependencies
npm install

# Start VitePress dev server (docs only)
npm run docs:dev

# Build VitePress docs
npm run docs:build

# Preview built docs
npm run docs:preview
```

**Note:** Deploy mode (index.html) doesn't need building - it's served as static HTML.

## Easter Eggs

### Star Wars Prank Page
**URL:** https://voldigoad3421.github.io/starwars

**What it does:**
- Displays bouncing middle finger emoji 🖕
- "Got 'em! 😂" message fades in
- Click emoji for 360° spin animation

**Purpose:** Prank link to send to friends

**File:** `starwars/index.html`

## Design Philosophy

### Deploy Mode Design Choices

**Why Pure HTML/CSS?**
- No build step required
- Instant loading
- Easy to edit (no framework knowledge needed)
- Perfect for simple landing page

**Visual Style:**
- Purple gradient conveys tech/modern feel
- Frosted glass creates depth and sophistication
- Large, readable code blocks for easy copying
- Mobile-first responsive design

**UX Decisions:**
- One-click copy buttons (no manual selection)
- Category organization (easy to scan)
- Prominent link to docs for learning
- Short, memorable URLs emphasized

### Doc Mode Design Choices

**Why VitePress?**
- Fast, optimized for documentation
- Vue-based with modern DX
- Built-in search functionality
- Markdown-based content (easy to write)
- Excellent mobile experience

**Custom Styling:**
- Matches deploy mode gradient colors
- Enhanced hover effects on feature cards
- Smooth transitions throughout
- Dark mode support (VitePress built-in)

## Configuration Files

### package.json
```json
{
  "scripts": {
    "docs:dev": "vitepress dev docs",
    "docs:build": "vitepress build docs",
    "docs:preview": "vitepress preview docs"
  },
  "devDependencies": {
    "vitepress": "^1.0.0",
    "vue": "^3.3.0"
  }
}
```

### index.html Key Features
- Copy-to-clipboard JavaScript function
- ANSI color code visualization for bash scripts
- Responsive breakpoints at 768px and 480px
- Animated gradient background
- Smooth hover transforms on cards

## Testing

### Before Deployment

**Test Deploy Mode:**
1. Open `index.html` in browser
2. Test copy buttons
3. Test responsive design (mobile view)
4. Verify all links work

**Test Doc Mode:**
```bash
# Start dev server
npm run docs:dev

# Visit http://localhost:5173/docs/
# Test navigation, search, responsive design
```

**Test Scripts:**
```bash
# In WSL/Ubuntu
curl -fsSL localhost:5173/wsl/setup.sh | bash
```

### After Deployment

1. Wait 1-2 minutes for GitHub Actions
2. Visit https://voldigoad3421.github.io/
3. Test deploy mode copy buttons
4. Visit https://voldigoad3421.github.io/docs/
5. Test doc mode navigation
6. Test script URLs:
   ```bash
   curl -I https://voldigoad3421.github.io/wsl/setup.sh
   ```

## Common Issues

### Scripts Return 404
**Cause:** Directory not copied in GitHub Actions workflow
**Fix:** Add directory to `deploy.yml`:
```yaml
cp -r new_category _site/
```

### Docs Look Unstyled
**Cause:** Wrong base path in VitePress config
**Fix:** Ensure `base: '/docs/'` in `config.js`

### Deploy Mode Not Updating
**Cause:** Browser cache
**Fix:** Hard refresh (Ctrl+Shift+R) or clear cache

## Related Projects

- [voldiwsldeploy](https://github.com/voldigoad3421/voldiwsldeploy) - WSL setup scripts (source)
- [voldideploy](https://github.com/voldigoad3421/voldideploy) - Docker deployment manager

## Future Enhancements

Planned categories:
- **Windows** - PowerShell setup scripts
- **MDT** - Microsoft Deployment Toolkit automation
- **Hyper-V** - Hyper-V configuration scripts
- **Sysadmin** - Common sysadmin tasks
- **Networking** - Network configuration tools

## Code Style

**HTML:**
- Semantic HTML5 elements
- BEM-style class naming for components
- Inline SVG for icons when needed

**CSS:**
- CSS custom properties for theming
- Mobile-first media queries
- Smooth transitions on interactive elements
- Consistent spacing scale (0.5rem increments)

**JavaScript:**
- Vanilla JS (no dependencies)
- Clear function names
- Comments for complex logic

**Markdown (docs):**
- Frontmatter for page metadata
- Code fences with language tags
- Consistent heading hierarchy

## Git Workflow

**Branch:** `main`

**Commit Style:**
- "Add [category] scripts and documentation"
- "Update [section] - [specific change]"
- "Fix [issue description]"

**Deployment:** Automatic on push to main via GitHub Actions
