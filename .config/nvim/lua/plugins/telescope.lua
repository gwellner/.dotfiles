local actions = require("telescope.actions")

local TELESCOPE = {
  "nvim-telescope/telescope.nvim",
}

TELESCOPE.keys = {
  {
    "<leader>tr",
    "<cmd>Telescope resume<CR>",
    desc = "Resume last buffer",
    noremap = true,
    silent = true,
  },
}

TELESCOPE.opts = {
  defaults = {
    layout_strategy = "horizontal",
    layout_config = { prompt_position = "top" },
    sorting_strategy = "ascending",
    winblend = 0,
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
    end,
  },
}

local PROJECT = {
  "nvim-telescope/telescope-project.nvim",
  keys = {
    {
      "<leader>fp",
      "<cmd>lua require'telescope'.extensions.project.project{}<CR>",
      desc = "Find Project",
      noremap = true,
      silent = true,
    },
  },
}

--[[
M.config = function()
  local actions = require("telescope.actions")
  require("telescope").setup({
    defaults = {
      layout_config = { prompt_position = "top" },
      mappings = {
        i = {
          -- map actions.which_key to <C-h> (default: <C-/>)
          -- actions.which_key shows the mappings for your picker,
          -- e.g. git_{create, delete, ...}_branch for the git_branches picker
          ["<C-j>"] = actions.move_selection_next,
          ["<C-k>"] = actions.move_selection_previous,
        },
      },
    },
  })
end
--]]

return { TELESCOPE, PROJECT }
