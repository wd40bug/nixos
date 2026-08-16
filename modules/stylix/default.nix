{
  config,
  lib,
  pkgs,
  ...
}:
{
  options.custom.stylix.enable = lib.mkEnableOption "Custom Stylix Setup";
  # options.custom.stylix.wallpaper = {
  #   link = lib.mkOption {
  #     type = lib.types.str;
  #     description = "Link to the wallpaper";
  #   };
  #   hash = lib.mkOption {
  #     type = lib.types.str;
  #     description = "Wallpaper Hash";
  #     default = lib.fakeHash;
  #   };
  # };

  config = lib.mkIf config.custom.stylix.enable {
    stylix = {
      enable = true;
      base16Scheme = "${pkgs.base16-schemes}/share/themes/onedark.yaml";
      polarity = "dark";
      # image = pkgs.fetchurl {
      #   url = "https://wallup.net/wp-content/uploads/2018/09/28/687841-artistic-art-artwork-painting-original.jpg";
      #   hash = "sha256-2oKTfLP9IaKtaDLdnWu2UIKcgMlj/Hu0BddqLnW8Eps=";
      # };
    };

    programs.fish.interactiveShellInit = ''
      # This runs after Stylix initializes, ensuring a readable contrast
      set -g fish_color_autosuggestion ffffff --bold
    '';
  };
}
