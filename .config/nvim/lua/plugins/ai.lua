return {
  -- {
  --   "jackMort/ChatGPT.nvim",
  --   cmd = { "ChatGPTActAs", "ChatGPT" },
  --   opts = {},
  -- },
  -- Custom Parameters (with defaults)
  {
    "David-Kunz/gen.nvim",
    event = "VeryLazy",
    opts = {

      quit_map = "q", -- set keymap to close the response window
      retry_map = "<c-r>", -- set keymap to re-send the current prompt
      accept_map = "<c-cr>", -- set keymap to replace the previous selection with the last result
      host = "localhost", -- The host running the Ollama service.
      port = "11434", -- The port on which the Ollama service is listening.
      display_mode = "horizontal-split", -- The display mode. Can be "float" or "split" or "horizontal-split" or "vertical-split".
      show_prompt = false, -- Shows the prompt submitted to Ollama. Can be true (3 lines) or "full".
      show_model = false, -- Displays which model you are using at the beginning of your chat session.
      no_auto_close = true, -- Never closes the window automatically.
      file = false, -- Write the payload to a temporary file to keep the command short.
      hidden = false, -- Hide the generation window (if true, will implicitly set `prompt.replace = true`), requires Neovim >= 0.10

      init = function(options)
        pcall(io.popen, "ollama serve > /dev/null 2>&1 &")
        require("which-key").add({
          { "<leader>a", group = "ai" },
        })
      end,
      -- Function to initialize Ollama
      command = function(options)
        local body = { model = options.model, stream = true }
        return "curl --silent --no-buffer -X POST http://"
          .. options.host
          .. ":"
          .. options.port
          .. "/api/chat -d $body"
      end,
      -- The command for the Ollama service. You can use placeholders $prompt, $model and $body (shellescaped).
      -- This can also be a command string.
      -- The executed command must return a JSON object with { response, context }
      -- (context property is optional).
      -- list_models = '<omitted lua function>', -- Retrieves a list of model names
      result_filetype = "markdown", -- Configure filetype of the result buffer
      debug = false, -- Prints errors and the command which is run.
      -- ------- Custom Parameters (with defaults)
      {
        "David-Kunz/gen.nvim",
        opts = {
          model = "codellama", -- The default model to use.
          quit_map = "q", -- set keymap to close the response window
          retry_map = "<c-r>", -- set keymap to re-send the current prompt
          accept_map = "<c-cr>", -- set keymap to replace the previous selection with the last result
          host = "localhost", -- The host running the Ollama service.
          port = "11434", -- The port on which the Ollama service is listening.
          display_mode = "float", -- The display mode. Can be "float" or "split" or "horizontal-split" or "vertical-split".
          show_prompt = false, -- Shows the prompt submitted to Ollama. Can be true (3 lines) or "full".
          show_model = false, -- Displays which model you are using at the beginning of your chat session.
          no_auto_close = false, -- Never closes the window automatically.
          file = false, -- Write the payload to a temporary file to keep the command short.
          hidden = false, -- Hide the generation window (if true, will implicitly set `prompt.replace = true`), requires Neovim >= 0.10
          init = function(options)
            pcall(io.popen, "ollama serve > /dev/null 2>&1 &")
          end,
          -- Function to initialize Ollama
          command = function(options)
            local body = { model = options.model, stream = true }
            return "curl --silent --no-buffer -X POST http://"
              .. options.host
              .. ":"
              .. options.port
              .. "/api/chat -d $body"
          end,
          -- The command for the Ollama service. You can use placeholders $prompt, $model and $body (shellescaped).
          -- This can also be a command string.
          -- The executed command must return a JSON object with { response, context }
          -- (context property is optional).
          -- list_models = '<omitted lua function>', -- Retrieves a list of model names
          result_filetype = "markdown", -- Configure filetype of the result buffer
          debug = true, -- Prints errors and the command which is run.
        },
      }, -----------------------------------------------------------------
      -- model = "codellama", -- The default model to use. default:mistral
      -- init = function(options)
      --   pcall(io.popen, "ollama serve > /dev/null 2>&1 &")
      -- end,
      -- -- Function to initialize Ollama
      -- command = "curl --silent --no-buffer -X POST http://localhost:11434/api/generate -d $body",
      -- -- The command for the Ollama service. You can use placeholders $prompt, $model and $body (shellescaped).
      -- -- This can also be a lua function returning a command string, with options as the input parameter.
      -- -- The executed command must return a JSON object with { response, context }
      -- -- (context property is optional).
      -- list_models = "<function>", -- Retrieves a list of model names
      -- debug = false, -- Prints errors and the command which is run.
    },
    keys = {
      {
        "<leader>ai",
        ":Gen<CR>",
        desc = "Ollama Gen",
        mode = { "n", "v" },
      },
    },
  },
  -- {
  --   "CopilotC-Nvim/CopilotChat.nvim",
  --   branch = "main",
  --   cmd = "CopilotChat",
  --   opts = function()
  --     local user = vim.env.USER or "User"
  --     user = user:sub(1, 1):upper() .. user:sub(2)
  --     return {
  --       auto_insert_mode = true,
  --       headers = {
  --         user = "  " .. user .. " ",
  --         assistant = "  Copilot ",
  --         tool = "󰊳  Tool ",
  --       },
  --       window = {
  --         width = 0.4,
  --       },
  --     }
  --   end,
  --   keys = {
  --     -- Since its a problem with Tmux navigation.
  --     { "<C-l>", false, ft = "copilot-chat", desc = "Disable Clear" },
  --   },
  -- },
}
