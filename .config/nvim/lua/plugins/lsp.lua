-- https://github.com/Jomik/dotfiles/blob/718c8f82963dfc0f0a1c4c25725b75223024a68c/.config/nvim/lua/plugins/lang/yaml.lua
-- Default shemastore:
-- https://raw.githubusercontent.com/SchemaStore/schemastore/master/src/api/json/catalog.json
return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, { "yaml" })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "b0o/SchemaStore.nvim",
      version = false, -- last release is way too old
    },
    opts = {
      -- make sure mason installs the server
      ---@type lspconfig.options
      servers = {
        yamlls = {
          capabilities = {
            textDocument = {
              foldingRange = {
                dynamicRegistration = false,
                lineFoldingOnly = true,
              },
            },
          },
          -- lazy-load schemastore when needed
          on_new_config = function(new_config)
            new_config.settings.yaml.schemas = new_config.settings.yaml.schemas or {}
            vim.list_extend(new_config.settings.yaml.schemas, require("schemastore").yaml.schemas())
          end,
          settings = {
            yaml = {
              format = { enable = true },
              hover = true,
              validate = true,
              keyOrdering = false,
              -- https://docs.gitlab.com/ee/ci/yaml/yaml_optimization.html#reference-tags
              customTags = {
                "!reference sequence",
              },
            },
          },
        },
      },
    },
  },
  -- Dont work for me
  -- {
  --   "someone-stole-my-name/yaml-companion.nvim",
  --   requires = {
  --     { "neovim/nvim-lspconfig" },
  --     { "nvim-lua/plenary.nvim" },
  --     { "nvim-telescope/telescope.nvim" },
  --   },
  --   config = function()
  --     require("telescope").load_extension("yaml_schema")
  --   end,
  -- },
}
