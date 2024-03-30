-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
vim.api.nvim_command("augroup terminal")
vim.api.nvim_command("autocmd TermOpen * setlocal nonumber norelativenumber") -- no numbers
vim.api.nvim_command("autocmd TermOpen * startinsert") -- starts in insert mode
vim.api.nvim_command("autocmd TermEnter * setlocal signcolumn=no") -- no sign column
vim.api.nvim_command("augroup END")

vim.keymap.set("t", "<esc>", "<C-\\><C-n>")
