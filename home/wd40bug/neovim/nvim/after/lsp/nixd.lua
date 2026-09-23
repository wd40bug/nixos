return {
  cmd = { 'nixd', '--inlay-hints=true' },
  settings = {
    nixd = {
      nixpkgs = {
        expr = '(builtins.getFlake (toString ./.)).inputs.nixpkgs { }',
      },
      -- If configuring NixOS options, point it to your system flake:
      options = {
        nixos = {
          expr = '(builtins.getFlake (toString ./.)).nixosConfigurations.seville.options',
        },
        home_manager = {
          expr = '(builtins.getFlake (toString ./.)).homeConfigurations."wd40bug@seville".options',
        },
      },
    },
  },
}
