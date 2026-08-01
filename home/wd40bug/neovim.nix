{ pkgs, ... }:
{
  home.packages = with pkgs;[
    lua-language-server
    tree-sitter
    clang-tools
  ];
}
