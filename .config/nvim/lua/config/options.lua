-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
-- ilike to close and open diffs with zo,zc,zD,zF
vim.opt.foldmethod = "manual"
-- ignore all white spaces when using window diffthis, or diffthis on different buffers, before diffoff
-- h diffopt
vim.opt.dip = "iwhiteall,filler,closeoff,algorithm:patience"
