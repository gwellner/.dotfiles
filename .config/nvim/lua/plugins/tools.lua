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
      require("which-key").register({
        ["<leader>t"] = { name = "+tools" },
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
      require("which-key").register({
        ["<leader>b"] = { name = "+box", mode = "v" },
      })
    end,
    keys = {
      {
        "<leader>bl",
        function()
          local cb = require("comment-box")
          cb.lbox()
        end,
        desc = "left box",
        mode = "v",
      },
      {
        "<leader>bc",
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
}
