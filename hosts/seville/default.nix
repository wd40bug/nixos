{
  config,
  lib,
  pkgs,
  ...
}:
{

  imports = [
    ./hardware-configuration.nix
    ./../../modules/gnome.nix
    ./../../modules/xserver.nix
  ];

  options.hostConfig = lib.mkOption {
    type = lib.types.attrsOf lib.types.anything;
    default = { };
    description = "Custom host metadata passed to Home Manager";
  };

  config = {
    hostConfig = {
      GUI = true;
      hostName = "Seville";
      desktop = "gnome";
    };
    networking.hostName = "seville";
    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;

    environment.systemPackages = [
      (lib.hiPrio (
        pkgs.runCommand "nvim.desktop-hide" { } ''
          mkdir -p "$out/share/applications"
          cat "${config.programs.neovim.finalPackage}/share/applications/nvim.desktop" > "$out/share/applications/nvim.desktop"
          echo "Hidden=1" >> "$out/share/applications/nvim.desktop"
        ''
      ))
    ];

    custom = {
      gnome = {enable = true;};
      xserver = {enable = true;};
    };
  };

}
