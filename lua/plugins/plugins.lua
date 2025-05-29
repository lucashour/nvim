return {
  -- Plugin Manager itself (not needed if using LazyVim starter)
  { "VundleVim/Vundle.vim", lazy = false },

  -- Markdown preview
  { "JamshedVesuna/vim-markdown-preview", ft = "markdown" },

  -- Utilities
  { "MarcWeber/vim-addon-mw-utils" },

  -- Git
  --{ "Xuyuanp/nerdtree-git-plugin", dependencies = { "preservim/nerdtree" } },
  { "kdheepak/lazygit.nvim", cmd = "LazyGit" },
  { "tpope/vim-fugitive", event = "VeryLazy" },

  -- UI & Colors
  { "chriskempson/base16-vim", lazy = false },
  --{ "flazz/vim-colorschemes", lazy = false },
  {
    "itchyny/lightline.vim",
    config = function()
      vim.g.lightline = { colorscheme = "wombat" }
      vim.opt.laststatus = 2
      vim.opt.showmode = false
    end,
  },

  -- File Navigation
  --{ "preservim/nerdtree", cmd = "NERDTreeToggle" },
  { "majutsushi/tagbar", cmd = "TagbarToggle" },
  --{ "ctrlpvim/ctrlp.vim", cmd = "CtrlP" },

  -- Grepper
  {
    "mhinz/vim-grepper",
    cmd = "Grepper",
    config = function()
      vim.opt.grepprg = "ack"
      vim.g.grepper = {
        tools = { "git", "pt" },
      }
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

  -- Completion
  {
    "neoclide/coc.nvim",
    branch = "master",
    build = "npm ci",
    config = function()
      vim.g.coc_global_extensions = { "coc-tsserver", "coc-flutter" }
    end,
  },

  -- Language Support
  { "pangloss/vim-javascript", ft = "javascript" },
  { "leafgarland/typescript-vim", ft = "typescript" },
  { "peitalin/vim-jsx-typescript", ft = "typescriptreact" },
  { "jparise/vim-graphql", ft = "graphql" },
  { "prisma/vim-prisma", ft = "prisma" },
  { "kchmck/vim-coffee-script", ft = "coffee" },
  { "vim-ruby/vim-ruby", ft = "ruby" },
  { "thoughtbot/vim-rspec", ft = "ruby" },
  { "tpope/vim-bundler", ft = "ruby" },
  { "tpope/vim-rails", ft = "ruby" },

  -- Snippets
  { "garbas/vim-snipmate", event = "InsertEnter" },
  { "honza/vim-snippets", lazy = true },

  -- Miscellaneous Tools
  { "rajasegar/vim-pnpm", ft = "json" },
  { "scrooloose/nerdcommenter", event = "VeryLazy" },
  { "supermaven-inc/supermaven-nvim", lazy = false },
  { "tpope/vim-sensible", lazy = false },
  {
    "tpope/vim-surround",
    keys = { "ds", "cs", "ys" },
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
