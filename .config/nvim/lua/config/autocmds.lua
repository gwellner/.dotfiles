-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
vim.api.nvim_command("augroup terminal")
vim.api.nvim_command("autocmd TermOpen * setlocal nonumber norelativenumber") -- no numbers
vim.api.nvim_command("autocmd TermOpen * startinsert") -- starts in insert mode
vim.api.nvim_command("autocmd TermEnter * setlocal signcolumn=no") -- no sign column
vim.api.nvim_command("augroup END")

vim.keymap.set("t", "<esc>", "<C-\\><C-n>")

-- Remove Ctrl+L from copilot-chat, delay is needed since it seems to be set after the FileType event is triggered.
vim.api.nvim_create_autocmd("FileType", {
  pattern = "copilot-chat",
  callback = function()
    vim.defer_fn(function()
      pcall(vim.api.nvim_buf_del_keymap, 0, "n", "<C-l>")
      pcall(vim.api.nvim_buf_del_keymap, 0, "i", "<C-l>")
    end, 100) -- delay in ms
  end,
})
