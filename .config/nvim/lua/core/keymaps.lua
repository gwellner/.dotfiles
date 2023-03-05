-- keymaps
-- https://neovim.io/doc/user/lua.html
vim.g.mapleader = ' '
vim.keymap.set('n','<leader>h',':nohlsearch<CR>')

-- commands
-- https://vonheikemen.github.io/devlog/tools/build-your-first-lua-config-for-neovim/
-- https://github.com/L3MON4D3/LuaSnip/blob/master/DOC.md#lua
vim.api.nvim_create_user_command('LuaSnipEdit',':lua require("luasnip.loaders").edit_snippet_files()',{});
