local M = {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    ...,
  },
}

M.config = function()
  local cmp = require("cmp")
  local lspkind = require("lspkind")

  vim.opt.completeopt = { "menu", "menuone", "noselect" }

  cmp.setup({
    -- I like it inline
    experimental = {
      ghost_text = true,
    },
    formatting = {
      format = lspkind.cmp_format({
        mode = "symbol_text",
        max_width = 50,
        symbol_map = { Copilot = "" },
      }),
    },

    mapping = {
      ["<C-k>"] = cmp.mapping.select_prev_item(),
      ["<C-j>"] = cmp.mapping.select_next_item(),
      ["<C-b>"] = cmp.mapping.scroll_docs(-4),
      ["<C-f>"] = cmp.mapping.scroll_docs(4),
      ["<C-Space>"] = cmp.mapping.complete(),
      ["<C-e>"] = cmp.mapping.abort(),
      ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    },
    sources = cmp.config.sources({
      { name = "copilot", group_index = 2 },
      { name = "nvim_lsp", group_index = 2 },
      { name = "luasnip" }, -- For luasnip users.
    }, {
      { name = "buffer" },
    }),
  })
end

return M
