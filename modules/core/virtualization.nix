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
      rootless = {
        enable = true;
        setSocketVariable = true;
      };
    };
  };

  #Add docker-compose
  environment.systemPackages = with pkgs; [ docker-compose ];
}
