{ pkgs, username, ... }:
{
  services.xserver = {
    enable = true;
    xkb.layout = "us";
    videoDrivers = [
      "modesetting"
      "nvidia"
    ];
  };
  services = {
    displayManager.autoLogin = {
      enable = true;
      user = "${username}";
    };
    libinput = {
      enable = true;
      # mouse = {
      #   accelProfile = "flat";
      # };
    };
  };
  # To prevent getting stuck at shutdown
  systemd.extraConfig = "DefaultTimeoutStopSec=10s";
}
