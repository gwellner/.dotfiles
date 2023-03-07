require("mason").setup()
require("mason-null-ls").setup({
	ensure_installed = {
		-- Opt to list sources here, when available in mason configuration is in null-ls.lua
		"prettier",
		"shfmt",
	},
	automatic_installation = false,
})

require("mason-null-ls").setup_handlers() -- If `automatic_setup` is true.

require("mason-lspconfig").setup({
	ensure_installed = {
		"lua_ls",
		"angularls",
		"tsserver",
		"html",
	},
})

local on_attach = function(_, _)
	vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, {})
	vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})

	vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
	vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {})
	vim.keymap.set("n", "gr", require("telescope.builtin").lsp_references, {})
	vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
end

local capabilities = require("cmp_nvim_lsp").default_capabilities()

require("lspconfig").lua_ls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
		},
	},
})
require("lspconfig").angularls.setup({ on_attach = on_attach, capabilities = capabilities })
require("lspconfig").tsserver.setup({ on_attach = on_attach, capabilities = capabilities })
require("lspconfig").html.setup({ on_attach = on_attach, capabilities = capabilities })
