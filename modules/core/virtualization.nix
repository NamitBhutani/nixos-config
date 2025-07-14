{
  config,
  pkgs,
  username,
  ...
}:
{

  # Enable rootless docker
  virtualisation = {
    docker = {
      enable = true;
      enableOnBoot = false;
      rootless = {
        enable = true;
        setSocketVariable = true;
      };
    };
  };

  #Add docker-compose
  environment.systemPackages = with pkgs; [ docker-compose ];
}
