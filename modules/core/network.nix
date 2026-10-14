{ pkgs, lib, ... }:
{
  networking = {
    hostName = "laptop";
    networkmanager.enable = true;
    modemmanager.enable = false;
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
  services.mihomo = {
    enable = true;
    tunMode = true;
    webui = pkgs.metacubexd;
    configFile = "/home/intellomaniac/config.yaml";
  };
  systemd.services.mihomo = {
    wantedBy = lib.mkForce [ ];
  };
  systemd.services.NetworkManager-wait-online.wantedBy = lib.mkForce [ ];
  environment.systemPackages = with pkgs; [
    networkmanagerapplet
  ];
}
