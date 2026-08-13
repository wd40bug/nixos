vim.lsp.config('verible',{
  cmd = {'verible-verilog-ls', '--rules_config_search'},
})

vim.lsp.enable('verible')
