local configs = require("lspconfig.configs")
local lspconfig = require("lspconfig")
local util = require("lspconfig.util")

-- vim-helm
return {
  -- ft = "helm",
  "towolf/vim-helm",
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
