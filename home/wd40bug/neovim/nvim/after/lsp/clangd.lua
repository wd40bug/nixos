return {
  on_attach = function(client, bufnr)
    vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
    vim.keymap.set('n', '<leader>h', function()
      vim.cmd.ClangdSwitchSourceHeader()
    end, { buffer = bufnr, desc = 'Switch to header file' })
    vim.keymap.set('n', '<leader>i', function()
      vim.cmd.ClangdTypeHierarchy()
    end, { buffer = bufnr, desc = 'Class Type Hierarchy' })

    client.server_capabilities.semanticTokensProvider = nil
  end,
  cmd = {
    'clangd',
    '--query-driver=~/Downloads/arm-gnu-toolchain-14.3.rel1-x86_64-arm-none-eabi/bin/arm-none-eabi-gcc,/home/wd40bug/.platformio/packages/toolchain-xtensa-esp32*/bin/xtensa-esp32-elf-g++',
    '--query-driver=/home/wdale/.platformio/packages/toolchain-gccarmnoneeabi/bin/arm-none-eabi-g++',
    '--query-driver=/home/wdale/.platformio/packages/toolchain-intelarc32/bin/arc-elf32-g++'
  }
}
