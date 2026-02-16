local M = {}

function M.run_visual_selection_in_zsh()
  -- Get visual selection range
  local start_pos = vim.fn.getpos("'<")
  local end_pos = vim.fn.getpos("'>")
  if not start_pos or not end_pos then
    vim.notify("Could not get visual selection range", vim.log.levels.ERROR)
    return
  end
  local bufnr = vim.api.nvim_get_current_buf()
  local lines = vim.api.nvim_buf_get_lines(bufnr, start_pos[2] - 1, end_pos[2], false)
  if not lines or #lines == 0 then
    vim.notify("No lines selected", vim.log.levels.ERROR)
    return
  end
  -- Write selection to temp file
  local tmpfile = "/tmp/nvim_bash_tmp.sh"
  local f = io.open(tmpfile, "w")
  if not f then
    vim.notify("Could not open temp file", vim.log.levels.ERROR)
    return
  end
  f:write(table.concat(lines, "\n"))
  f:close()
  -- Run the script with full environment by sourcing zshrc
  local output = vim.fn.systemlist("zsh -c 'source ~/.zshrc; zsh " .. tmpfile .. "'")
  -- Open a new vertical split and put the output in a new buffer
  vim.cmd("vsplit")
  vim.cmd("enew") -- create a new empty buffer in the split
  vim.api.nvim_buf_set_lines(0, 0, -1, false, output)
end

return M
