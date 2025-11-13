return {
  -- Markdown
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    build = "cd app && yarn install",
    init = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    ft = { "markdown" },
  },
  {
    "MeanderingProgrammer/render-markdown.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-mini/mini.nvim" }, -- if you use the mini.nvim suite
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-mini/mini.icons' },        -- if you use standalone mini plugins
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    opts = {},
  },

  -- UI & Colors
  { "chriskempson/base16-vim", lazy = false },
  {
    "itchyny/lightline.vim",
    config = function()
      vim.g.lightline = {
        colorscheme = "wombat",
        active = {
          left = {
            { "mode", "paste" },
            { "readonly", "filename", "modified" },
          },
          right = {
            { "lineinfo" },
            { "percent" },
            { "fileformat", "fileencoding", "filetype" },
          },
        },
      }
    end,
  },
  {
    "xiyaowong/transparent.nvim",
    lazy = false,

    config = function()
      require("transparent").setup({
        -- table: default groups
        groups = {
          "Normal",
          "NormalNC",
          "Comment",
          "Constant",
          "Special",
          "Identifier",
          "Statement",
          "PreProc",
          "Type",
          "Underlined",
          "Todo",
          "String",
          "Function",
          "Conditional",
          "Repeat",
          "Operator",
          "Structure",
          "LineNr",
          "NonText",
          "SignColumn",
          "CursorLine",
          "CursorLineNr",
          "StatusLine",
          "StatusLineNC",
          "EndOfBuffer",
        },
        -- table: additional groups that should be cleared
        extra_groups = {
          "NormalFloat", -- plugins which have float panel such as Lazy, Mason, LspInfo
          "NvimTreeNormal", -- NvimTree
        },
        -- table: groups you don't want to clear
        exclude_groups = {},
        -- function: code to be executed after highlight groups are cleared
        -- Also the user event "TransparentClear" will be triggered
        on_clear = function() end,
      })
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

  -- Git
  { "kdheepak/lazygit.nvim", cmd = "LazyGit" },
  { "tpope/vim-fugitive", event = "VeryLazy" },
  {
    "ruifm/gitlinker.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("gitlinker").setup({
        opts = {
          -- adds current line nr in the url for normal mode
          add_current_line_on_normal_mode = true,
          -- callback for what to do with the url
          action_callback = require("gitlinker.actions").open_in_browser,
          -- print the url after performing the action
          print_url = true,
        },
        callbacks = {
          ["github.com"] = require("gitlinker.hosts").get_github_type_url,
          ["gitlab.com"] = require("gitlinker.hosts").get_gitlab_type_url,
          ["try.gitea.io"] = require("gitlinker.hosts").get_gitea_type_url,
          ["codeberg.org"] = require("gitlinker.hosts").get_gitea_type_url,
          ["bitbucket.org"] = require("gitlinker.hosts").get_bitbucket_type_url,
          ["try.gogs.io"] = require("gitlinker.hosts").get_gogs_type_url,
          ["git.sr.ht"] = require("gitlinker.hosts").get_srht_type_url,
          ["git.launchpad.net"] = require("gitlinker.hosts").get_launchpad_type_url,
          ["repo.or.cz"] = require("gitlinker.hosts").get_repoorcz_type_url,
          ["git.kernel.org"] = require("gitlinker.hosts").get_cgit_type_url,
          ["git.savannah.gnu.org"] = require("gitlinker.hosts").get_cgit_type_url,
        },
        -- default mapping to call url generation with action_callback
        mappings = "<leader>gy",
      })
    end,
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
        javascript = { "eslint_d" },
        typescript = { "eslint_d" },
        typescriptreact = { "eslint_d" },
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
  {
    "chrisgrieser/nvim-rip-substitute",
    keys = {
      {
        "g/",
        function()
          require("rip-substitute").sub()
        end,
        mode = { "n", "x" },
        desc = "Rip Substitute",
      },
    },
  },
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
