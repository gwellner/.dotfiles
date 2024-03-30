local actions = require("telescope.actions")

local TELESCOPE = {
  "nvim-telescope/telescope.nvim",
  event = "VeryLazy",
}

TELESCOPE.keys = {
  {
    "<leader>tr",
    "<cmd>Telescope resume<CR>",
    desc = "Resume last buffer",
    noremap = true,
    silent = true,
  },
  {
    "<leader>tws",
    "<cmd>lua require('telescope').extensions.git_worktree.git_worktrees()<CR>",
    desc = "[S]how Worktrees",
    noremap = true,
    silent = true,
  },
  {
    "<leader>twc",
    "<cmd>lua require('telescope').extensions.git_worktree.create_git_worktree()<CR>",
    desc = "[C]reate Worktree",
    noremap = true,
    silent = true,
  },
}

TELESCOPE.opts = {
  pickers = {
    find_files = {
      find_command = { "rg", "--files", "--hidden", "-g", "!**/.git/*" },
    },
    live_grep = {
      hidden = true,
      additional_args = function()
        return { "--hidden" }
      end,
    },
  },
  defaults = {
    file_ignore_patterns = {
      "node_modules",
    },
    layout_strategy = "horizontal",
    layout_config = { prompt_position = "top" },
    sorting_strategy = "ascending",
    winblend = 0,
    path_display = { smart = true },
    mappings = {
      i = {
        -- map actions.which_key to <C-h> (default: <C-/>)
        -- actions.which_key shows the mappings for your picker,
        -- e.g. git_{create, delete, ...}_branch for the git_branches picker
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
      },
    },
    config = function()
      require("telescope").load_extension("project")
      require("telescope").load_extension("git_worktree")
    end,
    init = function()
      require("which-key").register({
        ["<leader>t"] = { name = "+tools" },
      })
    end,
    extensions = {
      project = {
        -- TODO: Does not work, because of Telesope config ?
        hidden_files = true,
      },
    },
  },
}

local PROJECT = {
  "nvim-telescope/telescope-project.nvim",
  keys = {
    {
      "<leader>fP",
      "<cmd>lua require'telescope'.extensions.project.project{}<CR>",
      desc = "Find Project",
      noremap = true,
      silent = true,
    },
  },
}

return { TELESCOPE, PROJECT }
