{
  ...
}:
{

  imports = [
    ./hardware-configuration.nix
    ./stylix
    ./../../modules/gnome.nix
    ./../../modules/xserver.nix
    ./../../modules/secrets.nix
    ./../../modules/core
    ./../../modules/guiapps
    ./../../home/wd40bug/user.nix
    ./../../home/gaming/user.nix
  ];

  config = {
    hostConfig = {
      GUI = true;
      hostName = "seville";
    };

    boot.loader.systemd-boot.enable = true;
    boot.loader.systemd-boot.configurationLimit = 5;
    boot.loader.efi.canTouchEfiVariables = true;

    custom = {
      gnome = {
        enable = true;
      };
      xserver = {
        enable = true;
      };
      guiapps = {
        enable = true;
        wireshark.enable = true;
      };
      users = {
        wd40bug.enable = true;
      };
    };

    time.timeZone = "America/Chicago";

    hardware.opengl = {
      enable = true;
      driSupport = true;
      driSupport32Bit = true;
    };

    programs.gamemode.enable = true;

  };

}
