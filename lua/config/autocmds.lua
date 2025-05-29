vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  command = [[%s/\s\+$//e]],
})

vim.api.nvim_create_autocmd("InsertLeave", {
  pattern = "*",
  command = "hi statusline guibg=green",
})

vim.api.nvim_create_augroup("myfiletypes", { clear = true })

vim.api.nvim_create_autocmd("FileType", {
  group = "myfiletypes",
  pattern = {
    "ruby",
    "eruby",
    "yaml",
    "html",
    "css",
    "javascript",
    "typescript",
    "javascriptreact",
    "typescriptreact",
    "php",
    "coffee",
    "json",
    "sh",
    "dart",
  },
  command = "setlocal ai sw=2 sts=2 et",
})

vim.api.nvim_create_autocmd("FileType", {
  group = "myfiletypes",
  pattern = { "ruby", "eruby", "yaml" },
  command = "setlocal path+=lib colorcolumn=80 iskeyword+=?",
})

vim.api.nvim_create_autocmd("CursorHold", {
  pattern = "*",
  command = "silent call CocActionAsync('highlight')",
})
