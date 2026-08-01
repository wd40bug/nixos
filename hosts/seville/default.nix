{ config, lib, pkgs, ... }: {

  imports = [./hardware-configuration.nix];
  
  options.hostConfig = lib.mkOption{
    type = lib.types.attrsOf lib.types.anything;
    default = {};
    description = "Custom host metadata passed to Home Manager";
  };

  config = {
    hostConfig = {
      GUI = true;
      hostName = "Seville";
    };
    networking.hostName = "seville";
    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;

    services.xserver.enable = true;
    services.displayManager.gdm.enable = true;
    services.desktopManager.gnome.enable = true;

    environment.gnome.excludePackages = with pkgs; [ gnome-tour gnome-user-docs epiphany gnome-maps ];

    services.xserver.xkb = {
      layout = "us";
      variant = "";
    };
  };


}
