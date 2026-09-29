{
  config, ...
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
    ./../../modules/ttunet
    ./../../modules/embedded
    ./../../modules/misc-user-fix.nix
    ./../../modules/distrobox
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
      ttunet.enable = true;
      distrobox.enable = true;
      embedded.enable = true;
      embedded.tangnano.enable = true;
    };

    time.timeZone = "America/Chicago";

    hardware.opengl = {
      enable = true;
    };

    services.xserver.videoDrivers = [ "nvidia" ];

    boot.initrd.luks.devices."luks-8069a48e-907c-4e88-97ae-f023f8922786".device =
      "/dev/disk/by-uuid/8069a48e-907c-4e88-97ae-f023f8922786";

    hardware = {
      bluetooth = {
        enable = true;
        powerOnBoot = true;
        settings = {
          General = {
            Experimental = true;
            FastConnectable = true;
          };
          Policy = {
            AutoEnable = true;
          };
        };
      };
      enableAllFirmware = true;
      graphics.enable = true;
    };

    hardware.nvidia = {
      # Modesetting is required.
      modesetting.enable = true;

      # Nvidia power management. Experimental, and can cause sleep/suspend to fail.
      # Enable this if you have graphical corruption issues or application crashes after waking
      # up from sleep. This fixes it by saving the entire VRAM memory to /tmp/ instead 
      # of just the bare essentials.
      powerManagement.enable = false;

      # Fine-grained power management. Turns off GPU when not in use.
      # Experimental and only works on modern Nvidia GPUs (Turing or newer).
      powerManagement.finegrained = false;

      # Use the NVidia open source kernel module (not to be confused with the
      # independent third-party "nouveau" open source driver).
      # Support is limited to the Turing and later architectures. Full list of 
      # supported GPUs is at: 
      # https://github.com/NVIDIA/open-gpu-kernel-modules#compatible-gpus 
      # Only available from driver 515.43.04+
      open = true;

      # Enable the Nvidia settings menu,
      # accessible via `nvidia-settings`.
      nvidiaSettings = true;

      # Optionally, you may need to select the appropriate driver version for your specific GPU.
      package = config.boot.kernelPackages.nvidiaPackages.stable;

      prime = {
      	intelBusId = "PCI:0:2:0";
	nvidiaBusId = "PCI:1:0:0";
	sync.enable = true;
      };
    };

    fileSystem."/mnt/games" = {
      device = "/dev/disk/by-uuid/a61c0b1e-e831-4173-9e49-ea6242180e9d";
      fsType = "btrfs";
      options = [
        "nofail"
      ];
    };
  };
}
