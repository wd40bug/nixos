{
  config,
  pkgs,
  lib,
  osConfig,
  ...
}:
{
  imports = [
    ./../wd40bug/gnome
  ];

  custom = {
    gnome.enable = osConfig.custom.gnome.enable;
  };

  home.username = "gaming";
  home.homeDirectory = "/home/gaming";

  home.stateVersion = "26.05"; # Please read the comment before changing.

  home.packages = with pkgs; [
    jetbrains-mono
    fastfetch
    discord
    signal-desktop
    protonup-ng
  ];

  home.sessionVariables = {
    STEAM_EXTRA_COMPAT_TOOLS_PATH = "\${HOME}/.steam/root/compatibilitytools.d";
  };

  programs.firefox = {
    enable = true;
  };

  xdg.enable = true;

  programs.home-manager.enable = true;
}
