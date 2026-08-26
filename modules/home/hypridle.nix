{ pkgs, ... }:
{
  services.hypridle = {
    enable = true;
    settings = {
      general = {
        lock_cmd = "pidof hyprlock || hyprlock";
        before_sleep_cmd = "loginctl lock-session";
        after_sleep_cmd = "hyprctl dispatch dpms on";
      };
      listener = [
        {
          timeout = 300;
          on-timeout = "hyprctl dispatch dpms off";
          on-resume = "hyprctl dispatch dpms on";
        }
        {
          # suspend only when on battery
          timeout = 900;
          on-timeout = "sh -c '${pkgs.acpi}/bin/acpi -a | grep -q off-line && systemctl suspend'";
        }
      ];
    };
  };
}
