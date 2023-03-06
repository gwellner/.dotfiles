-- keymaps
-- https://neovim.io/doc/user/lua.html
vim.g.mapleader = ' '
vim.keymap.set('n','<leader>h',':nohlsearch<CR>')
-- LuaSnip jump to jumpindex
-- https://github.com/L3MON4D3/LuaSnip
vim.keymap.set('i','<TAB>','<cmd>lua require("luasnip").jump(1)<Cr>')
vim.keymap.set('i','<S-TAB>','<cmd>lua require("luasnip").jump(-1)<Cr>')

-- set keybinds for both INSERT and VISUAL.
vim.keymap.set({"i","s"}, "<C-j>", "<Plug>luasnip-next-choice", {})
vim.keymap.set({"i","s"}, "<C-k>", "<Plug>luasnip-prev-choice", {})
vim.api.nvim_set_keymap("i", "<C-u>", "<cmd>lua require('luasnip.extras.select_choice')()<cr>",{})

-- commands
-- https://vonheikemen.github.io/devlog/tools/build-your-first-lua-config-for-neovim/
-- https://github.com/L3MON4D3/LuaSnip/blob/master/DOC.md#lua
vim.api.nvim_create_user_command('LuaSnipEdit',':lua require("luasnip.loaders").edit_snippet_files()',{});
