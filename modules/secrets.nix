{
  custom.secrets = builtins.fromJSON (builtins.readFile ./../secrets/secrets.json);
}
