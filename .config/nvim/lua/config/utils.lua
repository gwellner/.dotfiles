---@diagnostic disable: undefined-global
local M = {}

function M.run_visual_selection_in_zsh()
  -- Save current register and selection type
  local old_reg = vim.fn.getreg('"')
  local old_regtype = vim.fn.getregtype('"')

  -- Yank visual selection into the default register
  vim.cmd('normal! ""y')

  -- Get the yanked text
  local selection = vim.fn.getreg('"')
  if not selection or selection == "" then
    vim.notify("No text selected", vim.log.levels.ERROR)
    return
  end

  -- Restore previous register contents
  vim.fn.setreg('"', old_reg, old_regtype)

  -- Write selection to temp file
  local tmpfile = "/tmp/nvim_bash_tmp.sh"
  local f = io.open(tmpfile, "w")
  if not f then
    vim.notify("Could not open temp file", vim.log.levels.ERROR)
    return
  end
  f:write(selection)
  f:close()

  -- Run the script with full environment by sourcing zshrc
  local output = vim.fn.systemlist("zsh -c 'source ~/.zshrc; zsh " .. tmpfile .. "'")
  -- Open a new vertical split and put the output in a new buffer
  vim.cmd("vsplit")
  vim.cmd("enew") -- create a new empty buffer in the split
  vim.api.nvim_buf_set_lines(0, 0, -1, false, output)
end

return M
