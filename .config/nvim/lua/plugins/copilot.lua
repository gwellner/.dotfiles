-- Deactivate Copilot
-- stylua: ignore
--if true then
--  return {}
--end

local COPILOT = {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  build = ":Copilot auth",
  opts = {
    suggestion = { enabled = false },
    panel = { enabled = false },
  },
  config = function()
    require("copilot").setup({})
    vim.cmd("Copilot disable");
  end,
}

local COPILOT_CMP = {
  "zbirenbaum/copilot-cmp",
  dependencies = "copilot.lua",
  opts = {
    formatters = {
      label = require("copilot_cmp.format").format_label_text,
      insert_text = require("copilot_cmp.format").format_insert_text,
      preview = require("copilot_cmp.format").deindent,
    },
  },
  config = function(_, opts)
    local copilot_cmp = require("copilot_cmp")
    copilot_cmp.setup(opts)
    -- attach cmp source whenever copilot attaches
    -- fixes lazy-loading issues with the copilot cmp source
    require("lazyvim.util").on_attach(function(client)
      if client.name == "copilot" then
        copilot_cmp._on_insert_enter()
      end
    end)
  end,
}

return {
  COPILOT,
  COPILOT_CMP,
}
