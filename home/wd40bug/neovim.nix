{ pkgs, ... }:
{
  home.packages = with pkgs; [
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
    nil
    gopls
    kotlin-language-server
    pyright
    typescript-language-server
    verible

    (lib.hiPrio (
      pkgs.runCommand "nvim.desktop-hide" { } ''
        mkdir -p "$out/share/applications"
        cat "${config.programs.neovim.finalPackage}/share/applications/nvim.desktop" > "$out/share/applications/nvim.desktop"
        echo "Hidden=1" >> "$out/share/applications/nvim.desktop"
      ''
    ))
  ];
}
