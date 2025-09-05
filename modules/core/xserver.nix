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
    };
  };
  # To prevent getting stuck at shutdown
  systemd.extraConfig = ''
    DefaultTimeoutStopSec=5s
  '';

  systemd.user.extraConfig = ''
    DefaultTimeoutStopSec=5s
  '';
}
