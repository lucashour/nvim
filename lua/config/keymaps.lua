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

-- LSP, linting and formatting
map("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
map("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
map("n", "gy", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
map("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
map("n", "<leader>ac", vim.lsp.buf.code_action, { desc = "Code Action" })
map("n", "<leader>qf", vim.lsp.buf.format, { desc = "Format Document" })
map("n", "K", vim.lsp.buf.hover, { desc = "Hover Documentation" })
map("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename Symbol" })
map("n", "<leader>f", function()
  require("conform").format({ async = true, lsp_fallback = true })
end, { desc = "Format with conform.nvim" })
