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
    ./../../modules/core
  ];

  config = {
    hostConfig = {
      GUI = true;
      hostName = "seville";
    };

    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;

    custom = {
      gnome = {enable = true;};
      xserver = {enable = true;};
    };
  };

}
