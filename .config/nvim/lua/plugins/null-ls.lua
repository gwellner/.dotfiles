local M = {
  "jose-elias-alvarez/null-ls.nvim",
}

-- M.event = { "BufReadPre", "BufNewFile" },
-- M.dependencies = { "mason.nvim" },
-- https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTIN_CONFIG.md
M.opts = function()
  local nls = require("null-ls")
  return {
    root_dir = require("null-ls.utils").root_pattern(".null-ls-root", ".neoconf.json", "Makefile", ".git"),
    sources = {
      -- nls.builtins.formatting.fish_indent,
      -- https://prettier.io/docs/en/options.html#bracket-spacing
      ---[[
      nls.builtins.formatting.prettier.with({
        extra_args = function(params)
          return params.options
            and params.options.tabSize
            and {
              "--tab-width",
              params.options.tabSize,
            }
            and { "--no-bracket-spacing" } -- import { SOMETING } from ''
        end,
      }), --]]
      -- nls.builtins.diagnostics.fish,
      nls.builtins.formatting.stylua,
      nls.builtins.formatting.shfmt,
      -- nls.builtins.diagnostics.flake8,
    },
  }
end

return M
