{ pkgs, lib, ... }:
{
  networking = {
    hostName = "nixos";
    networkmanager.enable = true;
    nameservers = [ "1.1.1.1" ];
    firewall = {
      enable = true;
      checkReversePath = "loose";
      trustedInterfaces = [
        "tun+"
        "Meta"
      ];
    };
  };
  # mihomo proxy and tunnel setup
  services.mihomo = {
    enable = true;
    tunMode = true;
    webui = pkgs.metacubexd;
    configFile = /home/intellomaniac/config.yaml;
  };
  systemd.services.mihomo = {
    wantedBy = lib.mkForce [ ];
  };
  systemd.services.NetworkManager-wait-online.wantedBy = lib.mkForce [ ];
  environment.systemPackages = with pkgs; [
    networkmanagerapplet
  ];
}
