{
  config,
  pkgs,
  lib,
  username,
  ...
}:
{

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

  systemd.user.services.docker.wantedBy = lib.mkForce [ ];

  environment.systemPackages = with pkgs; [ docker-compose ];
}
