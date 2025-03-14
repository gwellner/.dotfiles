return {
  {
    "jackMort/ChatGPT.nvim",
    cmd = { "ChatGPTActAs", "ChatGPT" },
    opts = {},
  },
  -- Custom Parameters (with defaults)
  {
    "David-Kunz/gen.nvim",
    event = "VeryLazy",
    opts = {
      model = "codellama", -- The default model to use. default:mistral
      display_mode = "split", -- The display mode. Can be "float" or "split".
      show_prompt = false, -- Shows the Prompt submitted to Ollama.
      show_model = false, -- Displays which model you are using at the beginning of your chat session.
      no_auto_close = true, -- Never closes the window automatically.
      init = function(options)
        pcall(io.popen, "ollama serve > /dev/null 2>&1 &")
      end,
      -- Function to initialize Ollama
      command = "curl --silent --no-buffer -X POST http://localhost:11434/api/generate -d $body",
      -- The command for the Ollama service. You can use placeholders $prompt, $model and $body (shellescaped).
      -- This can also be a lua function returning a command string, with options as the input parameter.
      -- The executed command must return a JSON object with { response, context }
      -- (context property is optional).
      list_models = "<function>", -- Retrieves a list of model names
      debug = false, -- Prints errors and the command which is run.
    },
    init = function()
      require("which-key").add({
        { "<leader>a", group = "ai" },
      })
    end,
    keys = {
      {
        "<leader>ai",
        ":Gen<CR>",
        desc = "Ollama Gen",
        mode = { "n", "v" },
      },
    },
  },
}
