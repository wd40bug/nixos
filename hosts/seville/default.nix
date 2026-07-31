{ config, lib, ... }: {

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

  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  };


}
