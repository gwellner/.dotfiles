-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- If the text to be passed to the shell command is first yanked to a register, say, the unnamed one, one can use the following command:
-- :echo system('base64 --decode', @")
-- The mapping can further be modified to replace the selected text with the output of the shell command via the expression register:
vim.keymap.set({ "v" }, "<leader>64", "c<c-r>=system('base64 --decode', @\")<cr><esc>", { desc = "decode base64" })
