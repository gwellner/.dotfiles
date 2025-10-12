-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- If the text to be passed to the shell command is first yanked to a register, say, the unnamed one, one can use the following command:
-- :echo system('base64 --decode', @")
-- The mapping can further be modified to replace the selected text with the output of the shell command via the expression register:
vim.keymap.set({ "v" }, "<leader>64", "c<c-r>=system('base64 --decode', @\")<cr><esc>", { desc = "decode base64" })

vim.keymap.set("v", "<leader>cr", function()
  -- Save the visual selection to a temp file
  vim.cmd("w! /tmp/nvim_bash_tmp.sh")
  -- Run the script with full environment by sourcing zshrc
  local output = vim.fn.systemlist("zsh -c 'source ~/.zshrc; zsh /tmp/nvim_bash_tmp.sh'")
  -- Open a new vertical split and put the output in a new buffer
  vim.cmd("vsplit")
  vim.cmd("enew") -- create a new empty buffer in the split
  vim.api.nvim_buf_set_lines(0, 0, -1, false, output)
end, { noremap = true, silent = true, desc = "Run in a zsh" })

vim.keymap.set("v", "<leader>ct", function()
  -- Save the visual selection to a temp file
  vim.cmd("w! /tmp/nvim_bash_tmp.sh")
  -- Open a new vertical split terminal, source the script, then keep the shell open
  vim.cmd("vsplit | terminal zsh -c 'source ~/.zshrc; source /tmp/nvim_bash_tmp.sh; exec zsh'")
end, { noremap = true, silent = true, desc = "Run in terminal, keep shell open, and add to history" })
