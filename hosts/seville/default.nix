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
      desktop = "gnome";
    };
    networking.hostName = "seville";
    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;

    services.xserver.enable = true;
    services.displayManager.gdm.enable = true;
    services.desktopManager.gnome.enable = true;

    environment.gnome.excludePackages = with pkgs; [ gnome-tour gnome-user-docs epiphany gnome-maps gnome-console ];

    environment.systemPackages = [
      (lib.hiPrio (pkgs.runCommand "nvim.desktop-hide" { } ''
        mkdir -p "$out/share/applications"
        cat "${config.programs.neovim.finalPackage}/share/applications/nvim.desktop" > "$out/share/applications/nvim.desktop"
        echo "Hidden=1" >> "$out/share/applications/nvim.desktop"
      ''))
    ];

    services.xserver.xkb = {
      layout = "us";
      variant = "";
    };
  };


}
