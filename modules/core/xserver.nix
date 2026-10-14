{ pkgs, username, ... }:
let
  hyprland-session = pkgs.writeShellScript "hyprland-session" ''
    conf="''${XDG_CACHE_HOME:-$HOME/.cache}/hypr/panel-rate.conf"
    ${pkgs.coreutils}/bin/mkdir -p "''${conf%/*}"
    rate=240
    read -r ac </sys/class/power_supply/ADP1/online 2>/dev/null && [ "$ac" = 0 ] && rate=151
    echo "monitor = desc:Sharp Corporation LQ173M1JW05,1920x1080@$rate,1920x0,1.00" >"$conf"
    exec start-hyprland
  '';
in
{
  services.xserver.videoDrivers = [
    "modesetting"
    "nvidia"
  ];

  services.greetd = {
    enable = true;
    settings = {
      initial_session = {
        command = "${hyprland-session}";
        user = "${username}";
      };
      default_session = {
        command = "${hyprland-session}";
        user = "${username}";
      };
    };
  };

  services.libinput.enable = true;
}
