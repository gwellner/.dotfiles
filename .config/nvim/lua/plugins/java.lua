---@diagnostic disable: undefined-global
return {
  "mfussenegger/nvim-jdtls",
  opts = {
    -- Ensure root_markers is a single flat table of strings
    root_markers = {
      "mvnw",
      "gradlew",
      "pom.xml",
      "build.gradle",
      ".git",
      "settings.gradle",
    },
    jdtls = {
      settings = {
        java = {
          format = {
            enabled = true,
            settings = {
              url = vim.fn.expand("~/.config/nvim/formatter/intellij-style.xml"),
              profile = "IntelliJ IDEA",
            },
          },
        },
      },
    },
  },
}
