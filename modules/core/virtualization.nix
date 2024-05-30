{ config, pkgs, username, ... }:
{
  # Add user to docker group
  users.users.${username}.extraGroups = [ "docker" ];

  # Enable docker
  virtualisation = {
    docker = {
      enable = true;
      storageDriver = "btrfs";
      rootless = {
        enable = true;
        setSocketVariable = true;
      };
    };
  };

  #Add docker-compose
  environment.systemPackages = with pkgs; [docker-compose];
}