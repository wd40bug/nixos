{
  custom.secrets = builtins.fromJSON (builtins.readFile ./../../secrets/wd40bug-secrets.json);
}
