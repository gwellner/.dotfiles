local configs = require("lspconfig.configs")
local lspconfig = require("lspconfig")
local util = require("lspconfig.util")

-- https://github.com/LazyVim/LazyVim/discussions/2281
-- Disable yamlls for helm fileype so that yamlls is not loaded when edditing a helm chart.

require("lazyvim.util").lsp.on_attach(function(client, buffer)
  if client.name == "yamlls" then
    if vim.api.nvim_buf_get_option(buffer, "filetype") == "helm" then
      vim.schedule(function()
        vim.cmd("LspStop ++force yamlls")
      end)
    end
  end
end)

-- vim-helm
return {
  ft = "helm",
  "towolf/vim-helm",

  dependencies = {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        helm_ls = {},
        yamlls = {},
      },
    },
  },
  config = function()
    if not configs.helm_ls then
      configs.helm_ls = {
        default_config = {
          cmd = { "helm_ls", "serve" },
          filetypes = { "helm" },
          root_dir = function(fname)
            return util.root_pattern("Chart.yaml")(fname)
          end,
        },
      }
    end

    lspconfig.helm_ls.setup({
      filetypes = { "helm" },
      cmd = { "helm_ls", "serve" },
    })
  end,
}
