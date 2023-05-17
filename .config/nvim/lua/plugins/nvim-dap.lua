local DAP = {
  "mfussenegger/nvim-dap",
}

--[[vim.fn.sign_define('DapBreakpoint', {text='🟥', texthl='', linehl='', numhl=''})
vim.fn.sign_define('DapStopped', {text='⭐️', texthl='', linehl='', numhl=''})
EOF
nnoremap <leader>dh :lua require'dap'.toggle_breakpoint()<CR>
nnoremap <S-k> :lua require'dap'.step_out()<CR>
nnoremap <S-l> :lua require'dap'.step_into()<CR>
nnoremap <S-j> :lua require'dap'.step_over()<CR>
nnoremap <leader>ds :lua require'dap'.stop()<CR>
nnoremap <leader>dn :lua require'dap'.continue()<CR>
nnoremap <leader>dk :lua require'dap'.up()<CR>
nnoremap <leader>dj :lua require'dap'.down()<CR>
nnoremap <leader>d_ :lua require'dap'.disconnect();require'dap'.stop();require'dap'.run_last()<CR>
nnoremap <leader>dr :lua require'dap'.repl.open({}, 'vsplit')<CR><C-w>l
nnoremap <leader>di :lua require'dap.ui.variables'.hover()<CR>
vnoremap <leader>di :lua require'dap.ui.variables'.visual_hover()<CR>
nnoremap <leader>d? :lua require'dap.ui.variables'.scopes()<CR>
nnoremap <leader>de :lua require'dap'.set_exception_breakpoints({"all"})<CR>
nnoremap <leader>da :lua require'debugHelper'.attach()<CR>
nnoremap <leader>dA :lua require'debugHelper'.attachToRemote()<CR>
nnoremap <leader>di :lua require'dap.ui.widgets'.hover()<CR>
nnoremap <leader>d? :lua local widgets=require'dap.ui.widgets';widgets.centered_float(widgets.scopes)<CR> --]]

DAP.config = function() end

DAP.keys = {
  { "<C-M-j>", "<cmd>lua require('dap').step_over()<CR>", desc = "Step Over" },
  { "<C-M-l>", "<cmd>lua require('dap').step_into()<CR>", desc = "Step Into" },
  { "<leader>dm", "<cmd>lua require('dapui').eval()<CR>", desc = "DAP eval [after dd] [S-m]" },
  { "<leader>dj", "<cmd>lua require('dap').step_over()<CR>", desc = "Step Over [C-ALT-j]" },
  { "<leader>dl", "<cmd>lua require('dap').setp_into()<CR>", desc = "Step Into [C-ALT-j]" },
  { "<leader>ds", "<cmd>lua require('dap').close()<CR>", desc = "DAP stop" },
  { "<leader>dn", "<cmd>lua require('dap').continue()<CR>", desc = "DAP Continue" },
  { "<leader>dd", "<cmd>lua require('dapui').setup()<CR>", desc = "DAP ui setup" },
  { "<leader>do", "<cmd>lua require('dapui').toggle()<CR>", desc = "DAP ui toggle" },
  { "<leader>db", "<cmd>DapToggleBreakpoint<CR>", desc = "DAP ToggleBreakpoint" },
  { "<leader>de", "<cmd>lua require('dap').set_exception_breakpoints()<CR>", desc = "DAP Set Exception Breakpoints" },
  { "<S-m>", "<cmd>lua require('dapui').eval()<CR>", desc = "DAP eval" },
}

return {
  DAP,
  { "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } },
}
