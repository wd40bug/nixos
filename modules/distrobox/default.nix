{
  pkgs,
  config,
  lib,
  ...
}:
{
  options.custom.distrobox.enable = lib.mkEnableOption "Distrobox";

  config = lib.mkIf config.custom.distrobox.enable {
    virtualization.podman = {
      enable = true;
      dockerCompat = true;
    };

    environment.systemPackages = [ pkgs.distrobox ];

    environment.etc."distrobox/distrobox.conf".text = ''
      container_additional_volumes="/nix/store:/nix/store:ro /etc/profiles/per-user:/etc/profiles/per-user:ro /etc/static/profiles/per-user:/etc/static/profiles/per-user:ro"
    '';
  };
}
