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
          base00 = "ffffff";  
          base01 = "ffffff";  
          base02 = "ffffff";  
          base03 = "ffffff";  
          base04 = "ffffff";  
          base05 = "ffffff";  
          base06 = "ffffff";  
          base07 = "ffffff";  
          base08 = "ffffff";  
          base09 = "ffffff";  
          base0A = "ffffff";  
          base0B = "ffffff";  
          base0C = "ffffff";  
          base0D = "ffffff";  
          base0E = "ffffff";  
          base0F = "ffffff";  
        };
      };
    };
  };
}
