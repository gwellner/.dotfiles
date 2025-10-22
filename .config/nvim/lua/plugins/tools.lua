return {
  {
    "https://gitlab.com/itaranto/plantuml.nvim",
    ft = "puml,uml",
    version = "*",
    config = function()
      require("plantuml").setup({
        renderer = {
          type = "image",
          options = {
            prog = "imv",
            dark_mode = true,
          },
        },
        render_on_write = true,
      })
    end,
  },
  {
    -- TSInstall sql is needed.
    -- Connection Strings patterns possible
    -- https://pkg.go.dev/github.com/lib/pq#hdr-Connection_String_Parameters
    -- https://www.postgresql.org/docs/current/libpq-connect.html#LIBPQ-CONNSTRING
    -- example where a ; semicolon is in password escaped by %3B (;password)
    -- postgresql://psadibucb2c-fw-prod-0147-p.mds.poi.com:30147/fahrzeugwartung?sslmode=disable&password=%3Bpassword&user=app_user
    --
    -- name: webdb04q (AT)
    -- type: oracle
    -- url: oracle://INTATGW:%214KvKWbJXcCMq@localhost:1521/WEB04DB.qa.weltauto
    -- url: oracle://INTATGW:%214KvKWbJXcCMq@0.0.0.0:1521/WEB04DB.qa.weltauto
    -- page size:
    "kndndrj/nvim-dbee",
    dependencies = {
      "MunifTanjim/nui.nvim",
    },
    build = function()
      -- Install tries to automatically detect the install method.
      -- if it fails, try calling it with one of these parameters:
      --    "curl", "wget", "bitsadmin", "go"
      require("dbee").install()
    end,
    config = function()
      require("dbee").setup(--[[optional config]] { lazy = true })
    end,
    init = function()
      require("which-key").add({
        { "<leader>t", group = "tools" },
      })
    end,
    keys = {
      {
        "<leader>td",
        function()
          require("dbee").toggle()
        end,
        desc = "Database View",
      },
    },
  },
  -- {
  --   "hrsh7th/nvim-cmp",
  --   dependencies = {
  --     {
  --       "MattiasMTS/cmp-dbee",
  --       dependencies = {
  --         { "kndndrj/nvim-dbee" },
  --       },
  --       ft = "sql", -- optional but good to have
  --       opts = {}, -- needed
  --     },
  --   },
  --   opts = {
  --     sources = {
  --       { "cmp-dbee" },
  --     },
  --   },
  -- },
  -- {
  --   "renerocksai/telekasten.nvim",
  --   dependencies = {
  --     "nvim-telescope/telescope.nvim",
  --     "nvim-lua/popup.nvim",
  --     "nvim-lua/plenary.nvim",
  --     "nvim-telescope/telescope.nvim",
  --     "nvim-telescope/telescope-media-files.nvim",
  --   },
  --   config = function()
  --     require("telescope").load_extension("media_files")
  --     require("telekasten").setup({
  --       home = vim.fn.expand("~/zettelkasten"), -- Put the name of your notes directory here
  --     })
  --   end
  -- },
  --
  --Plug 'ThePrimeagen/git-worktree.nvim'
  {
    "ThePrimeagen/git-worktree.nvim",
  },
  -- To be honest they are just bad.

  {
    "rest-nvim/rest.nvim",
    event = "VeryLazy",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      opts = function(_, opts)
        opts.ensure_installed = opts.ensure_installed or {}
        table.insert(opts.ensure_installed, "http")
      end,
    },
  },
  -- {
  --   "rest-nvim/rest.nvim",
  --   dependencies = { { "nvim-lua/plenary.nvim" } },
  --   event = "VeryLazy",
  --   config = function()
  --     require("rest-nvim").setup({
  --       --- Get the same options from Packer setup
  --     })
  --   end,
  -- },
  -- {
  --   "BlackLight/nvim-http",
  --   event = "VeryLazy",
  -- },
  --
  -- Still the best tool for git
  {
    "tpope/vim-fugitive",
    opt = false,
    cmd = {
      "G",
      "Git",
      "Gdiffsplit",
      "Gvdiffsplit",
      "Gedit",
      "Gsplit",
      "Gread",
      "Gwrite",
      "Ggrep",
      "Glgrep",
      "Gmove",
      "Gdelete",
      "Gremove",
      "Gbrowse",
    },
  },
  {
    "LudoPinelli/comment-box.nvim",
    init = function()
      require("which-key").add({
        { "<leader>B", group = "box", mode = "v" },
      })
    end,
    keys = {
      {
        "<leader>Bl",
        function()
          local cb = require("comment-box")
          cb.lbox()
        end,
        desc = "left box",
        mode = "v",
      },
      {
        "<leader>Bc",
        function()
          local cb = require("comment-box")
          cb.ccbox()
        end,
        desc = "left box",
        mode = "v",
      },
    },
  },
  { "wakatime/vim-wakatime" },
  {
    "christoomey/vim-tmux-navigator",
    cmd = {
      "TmuxNavigateLeft",
      "TmuxNavigateDown",
      "TmuxNavigateUp",
      "TmuxNavigateRight",
      "TmuxNavigatePrevious",
    },
    keys = {
      { "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
      { "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
      { "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
      { "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
      { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
    },
  },
  {
    "mikesmithgh/kitty-scrollback.nvim",
    enabled = true,
    lazy = true,
    cmd = { "KittyScrollbackGenerateKittens", "KittyScrollbackCheckHealth" },
    event = { "User KittyScrollbackLaunch" },
    -- version = '*', -- latest stable version, may have breaking changes if major version changed
    -- version = '^4.0.0', -- pin major version, include fixes and features that do not have breaking changes
    config = function()
      require("kitty-scrollback").setup()
    end,
  },
  {
    layz = true,
    "glepnir/nerdicons.nvim",
    cmd = "NerdIcons",
    config = function()
      require("nerdicons").setup({
        border = "single", -- Border
        prompt = "󰨭 ", -- Prompt Icon
        preview_prompt = " ", -- Preview Prompt Icon
        width = 0.5, -- flaot window width
        down = "<C-j>", -- Move down in preview
        up = "<C-k>", -- Move up in preview
        copy = "<C-y>", -- Copy to the clipboard
      })
    end,
    keys = {
      {
        "<leader>tN",
        "<cmd>NerdIcons<cr>",
        desc = "NerdIcons",
      },
    },
  },
  {
    "harrisoncramer/gitlab.nvim",
    lazy = true,
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "sindrets/diffview.nvim",
      -- "stevearc/dressing.nvim", -- Recommended but not required. Better UI for pickers.
      "nvim-tree/nvim-web-devicons", -- Recommended but not required. Icons in discussion tree.
    },
    build = function()
      require("gitlab.server").build(true)
    end, -- Builds the Go binary
    config = function()
      require("gitlab").setup()
    end,

    keys = {
      {
        "<leader>cg",
        desc = "Code Review GitLab",
      },
      {
        "<leader>cgl",
        function()
          require("gitlab").choose_merge_request()
        end,
        desc = "CGL",
      },
    },
  },
  {
    "R-nvim/R.nvim",
    -- Only required if you also set defaults.lazy = true
    lazy = false,
    -- R.nvim is still young and we may make some breaking changes from time
    -- to time (but also bug fixes all the time). If configuration stability
    -- is a high priority for you, pin to the latest minor version, but unpin
    -- it and try the latest version before reporting an issue:
    -- version = "~0.1.0"
    config = function()
      -- Create a table with the options to be passed to setup()
      ---@type RConfigUserOpts
      local opts = {
        hook = {
          on_filetype = function()
            vim.api.nvim_buf_set_keymap(0, "n", "<Enter>", "<Plug>RDSendLine", {})
            vim.api.nvim_buf_set_keymap(0, "v", "<Enter>", "<Plug>RSendSelection", {})
          end,
        },
        R_args = { "--quiet", "--no-save" },
        min_editor_width = 72,
        rconsole_width = 78,
        objbr_mappings = { -- Object browser keymap
          c = "class", -- Call R functions
          ["<localleader>gg"] = "head({object}, n = 15)", -- Use {object} notation to write arbitrary R code.
          v = function()
            -- Run lua functions
            require("r.browser").toggle_view()
          end,
        },
        disable_cmds = {
          "RClearConsole",
          "RCustomStart",
          "RSPlot",
          "RSaveClose",
        },
      }
      -- Check if the environment variable "R_AUTO_START" exists.
      -- If using fish shell, you could put in your config.fish:
      -- alias r "R_AUTO_START=true nvim"
      if vim.env.R_AUTO_START == "true" then
        opts.auto_start = "on startup"
        opts.objbr_auto_start = true
      end
      require("r").setup(opts)
    end,
  },
}
