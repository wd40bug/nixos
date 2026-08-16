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
      targets = {
        fish.colors.override = {
          withHashtag = {
            base00-hex = "ffffff";
            base01-hex = "ffffff";
            base02-hex = "ffffff";
            base03-hex = "ffffff";
            base04-hex = "ffffff";
            base05-hex = "ffffff";
            base06-hex = "ffffff";
            base07-hex = "ffffff";
            base08-hex = "ffffff";
            base09-hex = "ffffff";
            base0A-hex = "ffffff";
            base0B-hex = "ffffff";
            base0C-hex = "ffffff";
            base0D-hex = "ffffff";
            base0E-hex = "ffffff";
            base0F-hex = "ffffff";
          };
        };
      };
    };
  };
}
