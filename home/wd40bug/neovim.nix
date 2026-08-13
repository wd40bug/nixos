{ pkgs, ... }:
{
  home.packages = with pkgs;[
    lua-language-server
    tree-sitter
    clang-tools
    file
    sqlite
    jq
    ruff
    xmlformat
    gdb
    xclip
    lua5_1
    rustup
    fd
    fish-lsp
    nixd
    gopls
    kotlin-language-server
    pyright
    typescript-language-server
    verible
  ];
}
