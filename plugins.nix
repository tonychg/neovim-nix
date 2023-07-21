{ pkgs }:
with pkgs.vimPlugins; [
  onedark-nvim
  monokai-pro-nvim
  kommentary
  indent-blankline-nvim-lua
  nvim-autopairs
  glow-nvim
  gitsigns-nvim
  nvim-web-devicons
  toggleterm-nvim
  lualine-nvim
  lualine-lsp-progress
  nvim-tree-lua
  telescope-nvim
  plenary-nvim
  sqlite-lua
  nvim-neoclip-lua
  trouble-nvim
  registers-nvim

  (nvim-treesitter.withPlugins (
    p: [
      p.javascript
      p.typescript
      p.lua
      p.html
      p.bash
      p.css
      p.jsdoc
      p.nix
      p.scss
      p.tsx
      p.rust
      p.yaml
      p.json
      p.dockerfile
      p.gomod
      p.puppet
      p.scss
      p.sql
      p.terraform
      p.jsonnet
      p.markdown
      p.python
      p.vim
      p.vimdoc
      p.php
      p.vue
    ]
  ))
  copilot-vim
  nvim-lspconfig
  lspkind-nvim
  nvim-cmp
  cmp-nvim-lsp
  cmp-buffer
  cmp-path
  cmp-vsnip
  vim-vsnip
  cmp-cmdline
  cmp-emoji
  lspsaga-nvim
  nvim-treesitter-context
  lsp-format-nvim
  rust-tools-nvim
  lsp-status-nvim
  diffview-nvim
  null-ls-nvim
  lazygit-nvim
  telescope-recent-files
  nvim-dap
  nvim-dap-ui
  neodev-nvim
]
