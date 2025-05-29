local map = vim.keymap.set
local opts = { silent = true, noremap = true }

vim.g.mapleader = ","

-- General
map("n", "<leader>,", ":w<CR>", opts)
map("n", "<leader>q", ":q<CR>", opts)

-- Tabs
map("n", "<C-S-Up>", "<C-w><Up>", opts)
map("n", "<C-S-Down>", "<C-w><Down>", opts)

-- Split and vertical split
map("n", "<leader>sp", ":sp<CR>", opts)
map("n", "<leader>vs", ":vs<CR>", opts)

-- Search highlight toggle
map("n", "<Space>", ":nohlsearch<Bar>:echo<CR>", opts)

-- Plugin mappings (adjust based on actual LazyVim plugin setup)
map("n", "<leader>ff", "<cmd>Telescope find_files<CR>", opts)
map("n", "<leader>gg", "<cmd>LazyGit<CR>", opts)

-- Code actions and quickfix
map("n", "<leader>ac", "<Plug>(coc-codeaction)", {})
map("n", "<leader>qf", "<Plug>(coc-fix-current)", {})

-- Go to definitions/types/refs/etc.
map("n", "gd", "<Plug>(coc-definition)", { silent = true })
map("n", "gy", "<Plug>(coc-type-definition)", { silent = true })
map("n", "gi", "<Plug>(coc-implementation)", { silent = true })
map("n", "gr", "<Plug>(coc-references)", { silent = true })

-- Show documentation
map("n", "<leader>K", ":lua ShowDocumentation()<CR>", opts)

-- Smart Enter in insert mode
map(
  "i",
  "<CR>",
  [[coc#pum#visible() && coc#pum#info()['index'] == -1 ? "\<C-r>=coc#pum#cancel()\<CR>\<CR>" : coc#pum#visible() ? coc#_select_confirm() : "\<CR>"]],
  { expr = true, silent = true }
)
