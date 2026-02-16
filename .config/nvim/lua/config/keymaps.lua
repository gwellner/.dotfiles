-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- If the text to be passed to the shell command is first yanked to a register, say, the unnamed one, one can use the following command:
-- :echo system('base64 --decode', @")
-- The mapping can further be modified to replace the selected text with the output of the shell command via the expression register:
vim.keymap.set({ "v" }, "<leader>64", "c<c-r>=system('base64 --decode', @\")<cr><esc>", { desc = "decode base64" })

local utils = require("config.utils")

-- Only run the selected line in a zsh and ouput the return in a buffer.
vim.keymap.set(
  "v",
  "<leader>cr",
  utils.run_visual_selection_in_zsh,
  { noremap = true, silent = true, desc = "Run in a zsh" }
)

vim.keymap.set("v", "<leader>ct", function()
  -- Write only the visual selection to a temp file
  vim.cmd('silent! normal! "<Esc>:w! /tmp/nvim_bash_tmp.sh<CR>"')
  -- Open a new vertical split terminal and run only the temp file, then keep shell open
  vim.cmd("vsplit | terminal zsh -c 'source ~/.zshrc; /tmp/nvim_bash_tmp.sh; exec zsh'")
end, { noremap = true, silent = true, desc = "Run selection in terminal, keep shell open, and add to history" })
