---@diagnostic disable: undefined-global
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
  vim.cmd("silent! write") -- Save buffer first
  -- Get visual selection
  local start_pos = vim.fn.getpos("'<")
  local end_pos = vim.fn.getpos("'>")
  local lines = vim.fn.getline(start_pos[2], end_pos[2])
  if #lines > 0 then
    lines[#lines] = string.sub(lines[#lines], 1, end_pos[3])
    lines[1] = string.sub(lines[1], start_pos[3], #lines[1])
  end
  local content = table.concat(lines, "\n")
  -- Write to temp file
  local tmpfile = "/tmp/nvim_bash_tmp.sh"
  local f = io.open(tmpfile, "w")
  f:write(content)
  f:close()
  vim.fn.system("chmod +x " .. tmpfile)
  -- Open vertical split terminal and run the script
  vim.cmd("vsplit | terminal zsh -c 'source ~/.zshrc; " .. tmpfile .. "; exec zsh'")
end, { noremap = true, silent = true, desc = "Run selection in terminal, keep shell open, and add to history" })
