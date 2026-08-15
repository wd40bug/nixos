{ pkgs, lib, config, ... }:
{
  inputs.custom.neovim.enable = lib.mkEnableOption "Enable neovim configuration";
  config = lib.mkIf config.custom.neovim.enable {
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
    ];

    xdg.desktopEntries.nvim = {
      name = "Neovim";
      noDisplay = true;
      exec = "nvim %F";
      icon = "nvim";
      terminal = true;
      type = "Application";
    };

    xdg.configFile = {
      "nvim" = {
        source = config.lib.file.mkOutOfStoreSymlink "/etc/nixos/home/wd40bug/neovim/nvim";
        recursive = true;
      };
    };
  };
}
