-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

--autocmd BufNewFile,BufRead * if search('{{.\+}}', 'nw') | setlocal filetype=gotmpl | endif
vim.api.nvim_create_autocmd({ "BufNewFile,BufRead" }, {
  callback = function(_event)
    if vim.fn.search("{{.\\+}}", "nw") ~= 0 then
      vim.bo.filetype = "gotmpl"
    end
  end,
})
