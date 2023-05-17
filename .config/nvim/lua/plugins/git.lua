return {
  {
    enabled = true,
    "tpope/vim-fugitive",
    keys = {
      { "<leader>gb", "<cmd>Git blame<CR>", desc = "Git blame" },
    },
  },
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup({
        on_attach = function(bufnr)
          local gs = package.loaded.gitsigns

          local function map(mode, l, r, opts)
            opts = opts or {}
            opts.buffer = bufnr
            vim.keymap.set(mode, l, r, opts)
          end

          -- Navigation
          map("n", "]c", function()
            if vim.wo.diff then
              return "]c"
            end
            vim.schedule(function()
              gs.next_hunk()
            end)
            return "<Ignore>"
          end, { expr = true, desc = "next Hunk" })

          map("n", "[c", function()
            if vim.wo.diff then
              return "[c"
            end
            vim.schedule(function()
              gs.prev_hunk()
            end)
            return "<Ignore>"
          end, { expr = true, desc = "prev Hunk" })

          -- Actions
          map("v", "<leader>ghs", function()
            gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
          end, { desc = "Visual Stage Hunk" })
          map("v", "<leader>ghr", function()
            gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
          end, { desc = "Visual Reset Hunk" })
          map("n", "<leader>ghS", gs.stage_buffer, { desc = "Stage Bufffer" })
          map("n", "<leader>ghu", gs.undo_stage_hunk, { desc = "Undo Stage" })
          map("n", "<leader>ghR", gs.reset_buffer, { desc = "Reset Buffer Hunk" })
          map("n", "<leader>ghp", gs.preview_hunk, { desc = "Preview Hunk" })
          map("n", "<leader>ghb", function()
            gs.blame_line({ full = true })
          end, { desc = "Blame Line" })
          map("n", "<leader>t", "", { desc = "toggle" })
          map("n", "<leader>tb", gs.toggle_current_line_blame, { desc = "Blame" })
          map("n", "<leader>ghd", gs.diffthis, { desc = "Diff this 3 way" })
          map("n", "<leader>ghD", function()
            gs.diffthis("~")
          end, { desc = "Diff This 2 way" })
          map("n", "<leader>gtd", gs.toggle_deleted, { desc = "Deleted" })

          -- Text object
          map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", { desc = "Select Hunk" })
        end,
      })
    end,
  },
  keys = {
    { "<leader>hs", "gs.stage_hunk", desc = "Stage" },
  },
}
