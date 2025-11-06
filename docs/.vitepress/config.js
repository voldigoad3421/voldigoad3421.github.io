export default {
  title: 'Quick Scripts Documentation',
  description: 'Comprehensive guides for IT administration scripts',

  // Base path for GitHub Pages subdirectory
  base: '/docs/',

  themeConfig: {
    // Top navigation with link back to quick install
    nav: [
      { text: '⚡ Quick Install', link: 'https://voldigoad3421.github.io' },
      { text: 'Home', link: '/' },
      { text: 'WSL', link: '/wsl/' },
    ],

    // Sidebar navigation
    sidebar: {
      '/wsl/': [
        {
          text: 'WSL Setup',
          items: [
            { text: 'Overview', link: '/wsl/' },
            { text: 'Installation', link: '/wsl/installation' },
            { text: 'Node.js Setup', link: '/wsl/nodejs' },
            { text: 'Terminal Setup', link: '/wsl/terminal' },
            { text: 'Troubleshooting', link: '/wsl/troubleshooting' },
          ]
        }
      ],
      '/windows/': [
        {
          text: 'Windows Scripts',
          items: [
            { text: 'Overview', link: '/windows/' },
          ]
        }
      ],
    },

    // Social links
    socialLinks: [
      { icon: 'github', link: 'https://github.com/voldigoad3421' }
    ],

    // Footer
    footer: {
      message: 'IT Administration Scripts & Tools',
      copyright: 'Built with VitePress'
    },

    // Search
    search: {
      provider: 'local'
    },

    // Edit link
    editLink: {
      pattern: 'https://github.com/voldigoad3421/voldigoad3421.github.io/edit/main/docs/:path',
      text: 'Edit this page on GitHub'
    }
  }
}
