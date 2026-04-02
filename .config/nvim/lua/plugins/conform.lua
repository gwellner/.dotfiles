---@diagnostic disable: undefined-global
--- https://www.lazyvim.org/plugins/formatting
return {
  "stevearc/conform.nvim",
  dependencies = { "mason.nvim" },
  opts = function()
    ---@diagnostic disable-next-line: undefined-doc-name
    ---@type conform.setupOpts
    local opts = {
      default_format_opts = {
        timeout_ms = 20000,
        async = true, -- not recommended to change
        quiet = false, -- not recommended to change
        lsp_format = "fallback", -- not recommended to change
      },
      formatters_by_ft = {
        lua = { "stylua" },
        fish = { "fish_indent" },
        sh = { "shfmt" },
        typescript = { "prettier" },
        javascript = { "prettier" },
        java = { "google_java_format" },
        -- java = { "lsp" },
        -- java = { "intellij_formatter" },
      },
      ---@diagnostic disable-next-line: undefined-doc-name
      ---@type table<string, conform.FormatterConfigOverride|fun(bufnr: integer): nil|conform.FormatterConfigOverride>
      formatters = {
        injected = { options = { ignore_errors = true } },

        -- Custom IntelliJ formatter
        intellij_formatter = {
          format = function(ctx)
            return {
              exe = vim.fn.expand("~/Tools/idea/idea-IU-253.31033.145/bin/format.sh"),
              args = {
                "format",
                "-allowDefaults", -- use default IntelliJ style if no XML
                ctx.bufname, -- the file to format
                -- optionally, you can still add: "--settings", "/path/to/IntelliJCodeStyle.xml"
              },
              stdin = false, -- formats files directly
            }
          end,
        },

        -- Example: google_java_format (commented)
        -- google_java_format = {
        --   command = "google-java-format",
        --   args = { "-" },
        --   stdin = true,
        -- },
      },
    }
    return opts
  end,
}
