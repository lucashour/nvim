return {
  -- Markdown preview
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    build = "cd app && yarn install",
    init = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    ft = { "markdown" },
  },

  -- Git
  { "kdheepak/lazygit.nvim", cmd = "LazyGit" },
  { "tpope/vim-fugitive", event = "VeryLazy" },

  -- UI & Colors
  { "chriskempson/base16-vim", lazy = false },
  {
    "itchyny/lightline.vim",
    config = function()
      vim.g.lightline = { colorscheme = "wombat" }
      vim.opt.laststatus = 2
      vim.opt.showmode = false
    end,
  },

  -- Telescope + dependencies
  { "nvim-lua/plenary.nvim" },
  {
    "nvim-telescope/telescope.nvim",
    version = "0.1.8",
    dependencies = { "nvim-lua/plenary.nvim" },
    cmd = "Telescope",
  },

  -- LSP
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        tsserver = {},
        dartls = {},
      },
    },
  },

  -- Formatters
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        javascript = { "prettier" },
        typescript = { "prettier" },
        typescriptreact = { "prettier" },
        json = { "prettier" },
        css = { "prettier" },
        html = { "prettier" },
        yaml = { "prettier" },
        markdown = { "prettier" },
      },
    },
  },

  -- Linters
  {
    "mfussenegger/nvim-lint",
    opts = {
      linters_by_ft = {
        javascript = { "eslint_d" },
        typescript = { "eslint_d" },
        typescriptreact = { "eslint_d" },
        json = { "eslint_d" },
      },
    },
  },

  -- Language Support
  { "peitalin/vim-jsx-typescript", ft = "typescriptreact" },
  { "jparise/vim-graphql", ft = "graphql" },
  { "prisma/vim-prisma", ft = "prisma" },
  { "kchmck/vim-coffee-script", ft = "coffee" },
  { "vim-ruby/vim-ruby", ft = "ruby" },
  { "thoughtbot/vim-rspec", ft = "ruby" },
  { "tpope/vim-bundler", ft = "ruby" },
  { "tpope/vim-rails", ft = "ruby" },

  -- Snippets
  { "rafamadriz/friendly-snippets" },
  {
    "L3MON4D3/LuaSnip",
    version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
    build = "make install_jsregexp",
  },

  -- AI
  {
    "greggh/claude-code.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim", -- Required for git operations
    },
    config = function()
      require("claude-code").setup()
    end,
  },
  { "supermaven-inc/supermaven-nvim", lazy = false },

  -- Miscellaneous Tools
  { "rajasegar/vim-pnpm", ft = "json" },
  {
    "numToStr/Comment.nvim",
    opts = {},
  },
  { "tpope/vim-sensible", lazy = false },
  {
    "kylechui/nvim-surround",
    version = "^3.0.0", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup({
        -- Configuration here, or leave empty to use defaults
      })
    end,
  },
  { "ryanoasis/vim-devicons", lazy = false },

  -- FZF
  {
    "junegunn/fzf",
    build = ":call fzf#install()",
  },
  {
    "junegunn/fzf.vim",
    dependencies = { "junegunn/fzf" },
  },
}
