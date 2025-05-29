function ShowDocumentation()
  local filetype = vim.bo.filetype
  if vim.fn.CocAction("hasProvider", "hover") == 1 then
    vim.fn.CocActionAsync("doHover")
  else
    vim.api.nvim_feedkeys("K", "in", false)
  end
end
