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
    ./../../modules/steam
    ./../../home/wd40bug/user.nix
    ./../../home/gaming/user.nix
  ];

  config = {
    hostConfig = {
      GUI = true;
      hostName = "los-alamos";
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
        gaming.enable = true;
      };
      steam = {
        enable = true;
      };
    };

    time.timeZone = "America/Chicago";

    hardware.opengl = {
      enable = true;
    };

    boot.initrd.luks.devices."luks-8069a48e-907c-4e88-97ae-f023f8922786".device =
      "/dev/disk/by-uuid/8069a48e-907c-4e88-97ae-f023f8922786";
  };

}
