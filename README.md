# nvim

My personal [Neovim](https://neovim.io) configuration, built on top of
[LazyVim](https://www.lazyvim.org) and tuned mostly for Ruby on Rails and
JavaScript/TypeScript work.

It's shared as-is: feel free to browse it, borrow pieces, or use it as a
starting point for your own setup.

## Highlights

- **LazyVim base** with the Ruby, TypeScript, Tailwind, SQL, Docker, JSON and
  YAML extras enabled (see [`lazyvim.json`](lazyvim.json)).
- **Ruby/Rails**: `vim-rails`, `vim-bundler`, `vim-rspec`, RuboCop as LSP and
  formatter (runs through `bundle exec` when a `Gemfile` is present), and
  [Herb](https://herb-tools.dev) language server for ERB templates.
- **JS/TS**: `eslint_d` for linting and formatting, Prettier for JSON, CSS,
  HTML, YAML and Markdown.
- **Format on save** via `conform.nvim` (disabled for ERB), lint on save via
  `nvim-lint`, and trailing whitespace stripped automatically.
- **Git**: LazyGit, Fugitive, and `gitlinker.nvim` to open the current line on
  GitHub/GitLab/etc.
- **AI**: Supermaven completions and `claude-code.nvim`.
- **UI**: base16 colors, Lightline (wombat), transparent background, devicons.
- **Markdown**: in-editor rendering and a browser preview.

## Requirements

- Neovim 0.11+
- Git, `make`, and a C compiler (for plugin builds)
- A [Nerd Font](https://www.nerdfonts.com) (configured for FiraCode Nerd Font)
- [ripgrep](https://github.com/BurntSushi/ripgrep) and
  [fd](https://github.com/sharkdp/fd) for searching
- [lazygit](https://github.com/jesseduffield/lazygit)
- [mise](https://mise.jdx.dev) with Ruby installed (the version is pinned in
  [`lua/config/options.lua`](lua/config/options.lua))
- Node.js and `yarn` (for `markdown-preview.nvim`), plus `eslint_d` and
  `prettier`
- Optional: `herb-language-server` for ERB support

Most language servers and tools can also be installed from inside Neovim with
`:Mason`.

## Installation

Back up any existing configuration first:

```sh
mv ~/.config/nvim ~/.config/nvim.bak
mv ~/.local/share/nvim ~/.local/share/nvim.bak
```

Then clone this repository and start Neovim:

```sh
git clone https://github.com/lucashour/nvim.git ~/.config/nvim
nvim
```

[lazy.nvim](https://github.com/folke/lazy.nvim) bootstraps itself on first
launch and installs every plugin. Versions are pinned in
[`lazy-lock.json`](lazy-lock.json).

## Structure

```
.
├── init.lua               # Entry point
├── lazyvim.json           # Enabled LazyVim extras
├── lazy-lock.json         # Pinned plugin versions
└── lua
    ├── config
    │   ├── autocmds.lua   # Indentation, format/lint on save, whitespace cleanup
    │   ├── keymaps.lua    # Custom key mappings
    │   ├── lazy.lua       # lazy.nvim bootstrap and setup
    │   └── options.lua    # Editor options
    └── plugins
        └── plugins.lua    # Plugin specs and overrides
```

## Key mappings

The leader key is `,`. On top of the LazyVim defaults:

| Mapping           | Action                          |
| ----------------- | ------------------------------- |
| `,,`              | Save file                       |
| `,q`              | Quit                            |
| `,sp` / `,vs`     | Horizontal / vertical split     |
| `<Space>`         | Clear search highlight          |
| `,ff`             | Find files (Telescope)          |
| `,/`              | Live grep (Telescope)           |
| `,gg`             | Open LazyGit                    |
| `,gy`             | Open current line in browser    |
| `,c<Space>`       | Toggle comment                  |
| `gd` / `gi` / `gy` / `gr` | Go to definition / implementation / type / references |
| `K`               | Hover documentation             |
| `,ac`             | Code action                     |
| `,rn`             | Rename symbol                   |
| `,f` / `,qf`      | Format buffer                   |
| `g/`              | Search and replace (rip-substitute) |

## License

Feel free to use anything here however you like.
