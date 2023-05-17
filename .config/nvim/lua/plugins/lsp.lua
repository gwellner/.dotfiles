return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "mfussenegger/nvim-jdtls",
  },
  opts = {
    server = {
      cssls = {},
      html = {},
      angularls = {},
      jdtls = {},
    },

    -- you can do any additional lsp server setup here
    -- return true if you don't want this server to be setup with lspconfig
    ---@type table<string, fun(server:string, opts:_.lspconfig.options):boolean?>
    setup = {
      jdtls = function(_, _)
        -- TODO: require jdtls and setup
        vim.notify("additional setup for jdtls nvim is needed")
        vim.api.nvim_create_autocmd("FileType", {
          pattern = "java",
          desc = "lsp.lua nvim-JDTLS setup",
          -- group = "lspconfig",
          callback = function()
            local config = {
              -- cmd = { "/usr/bin/jdtls" },
              cmd = { "/home/gw/.local/share/nvim/mason/bin/jdtls" },
              root_dir = vim.fs.dirname(vim.fs.find({ "gradlew", ".git", "mvnw" }, { upward = true })[1]),
              -- init_options = {
              --   bundles = {
              --     vim.fn.glob(
              --       "/home/gw/.local/share/nvim/mason/packages/java-debug-adapter/extension/server/com.microsoft.java.debug.plugin-*.jar",
              --       true
              --     ),
              --   },
              -- },
            }
            require("jdtls").start_or_attach(config)
          end,
        })
        return true
      end,
    },
  },
}
