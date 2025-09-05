{ pkgs, username, ... }:
{
  services.xserver = {
    enable = true;
    xkb.layout = "us";
    videoDrivers = [
      "modesetting"
      # "nvidia"
      "amdgpu"
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
  # systemd.settings.Manager = {
  #   DefaultTimeoutStopSec = "5s";
  # };
}
