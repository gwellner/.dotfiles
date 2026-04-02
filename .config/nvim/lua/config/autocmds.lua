-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
---@diagnostic disable: undefined-global
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

-- some shortcuts for gvdiffsplit
vim.api.nvim_create_autocmd("FileType", {
  pattern = "fugitive",
  callback = function()
    vim.api.nvim_buf_set_keymap(0, "n", "g2", ":diffget //2<CR>", { noremap = true, silent = true })
    vim.api.nvim_buf_set_keymap(0, "n", "g3", ":diffget //3<CR>", { noremap = true, silent = true })
  end,
})
