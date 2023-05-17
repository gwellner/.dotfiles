local m = {
  "jay-babu/mason-nvim-dap.nvim",
  dependencies = {
    --"mfussenegger/nvim-dap",
    --`"williamboman/mason.nvim",
  },
}

m.config = function()
  require("mason-nvim-dap").setup({
    handlers = {
      function(config)
        -- all sources with no handler get passed here
        -- Keep original functionality
        require("mason-nvim-dap").default_setup(config)
      end,
    },
  })
end

return m
