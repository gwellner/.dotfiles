return {
  {
    "harrisoncramer/gitlab.nvim",
    lazy = true,
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "sindrets/diffview.nvim",
      -- "stevearc/dressing.nvim", -- Recommended but not required. Better UI for pickers.
      -- "nvim-tree/nvim-web-devicons", -- Recommended but not required. Icons in discussion tree.
    },
    build = function()
      require("gitlab.server").build(true)
    end, -- Builds the Go binary
    config = function()
      require("gitlab").setup({
        discussion_signs = {
          virtual_text = true, -- Whether to show the comment text inline as floating virtual text
        },
      })
    end,

    keys = {
      {
        "<leader>tg",
        function()
          require("gitlab")
        end,
        desc = "Code Review GitLab",
      },
      {
        "<leader>tgl",
        desc = "Gitlab list merge requests",
        function()
          require("gitlab").choose_merge_request()
        end,
      },

      {
        "<leader>tgr",
        function()
          require("gitlab").review()
        end,
        desc = "Git lab review",
      },
      {
        "<leader>tgc",
        function()
          require("gitlab").create_comment()
        end,
        desc = "Gitlab create comment",
        mode = "n",
      },
      {
        "<leader>tgm",
        function()
          require("gitlab").create_mr()
        end,
        desc = "Create a merge request",
        mode = "n",
      },
      {
        "<leader>tgm",
        function()
          require("gitlab").perform_action("create_mr")
        end,
        desc = "Create MR (ZZ commit)",
        mode = "n",
      },
      {

        "<leader>tgA",
        function()
          require("gitlab").add_assignee()
        end,
        desc = "Add Assigne",
        mode = "n",
      },
      {
        "<leader>tgc",
        function()
          require("gitlab").create_multiline_comment()
        end,
        desc = "Gitlab create comment",
        mode = "v",
      },
      {
        "<leader>tgs",
        function()
          require("gitlab").create_comment_suggestion()
        end,
        desc = "Gitlab create comment suggestion",
        mode = "v",
      },
      {
        "<leader>tga",
        function()
          require("gitlab").approve()
        end,
        desc = "Gitlab Approve",
      },
      {
        "<leader>tgb",
        function()
          require("gitlab").open_in_browser()
        end,
        desc = "Gitlab Open in Browser",
      },
    },
  },
}
