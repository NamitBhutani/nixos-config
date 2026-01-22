{ ... }:
{
  programs.waybar.settings.mainBar = {
    position = "top";
    layer = "top";
    height = 5;
    margin-top = 0;
    margin-bottom = 0;
    margin-left = 0;
    margin-right = 0;
    modules-left = [
      "custom/launcher"
      "hyprland/workspaces"
    ];
    modules-center = [
      "temperature"
      "clock"
    ];
    modules-right = [
      "tray"
      "cpu"
      "memory"
      "disk"
      "backlight"
      "pulseaudio"
      "battery"
      "network"
      "custom/notification"
      "bluetooth"
    ];
    clock = {
      calendar = {
        format = {
          today = "<span color='#b4befe'><b><u>{}</u></b></span>";
        };
      };
      format = " {:%H:%M}";
      tooltip = "true";
      tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
      format-alt = " {:%d/%m}";
    };
    "hyprland/workspaces" = {
      active-only = false;
      disable-scroll = true;
      format = "{icon}";
      on-click = "activate";
      format-icons = {
        "1" = "";
        "2" = "󰘙";
        "3" = "󰈹";
        "4" = "󰙯";
        "5" = "";
        "6" = "";
        urgent = "";
        default = "";
        sort-by-number = true;
      };
      persistent-workspaces = {
        "1" = [ ];
        "2" = [ ];
        "3" = [ ];
        "4" = [ ];
        "5" = [ ];
      };
    };
    bluetooth = {
      format = " {status}";
      format-connected = " {device_alias}";
      format-disabled = "";
      tooltip-format = "{controller_alias}\t{controller_address}";
      tooltip-format-connected = "{controller_alias}\t{controller_address}\n\n{device_enumerate}";
      tooltip-format-enumerate-connected = "{device_alias}\t{device_address}";
    };

    memory = {
      format = "󰟜 {}%";
      format-alt = "󰟜 {used} GiB"; # 
      interval = 2;
    };
    cpu = {
      format = "  {usage}%";
      format-alt = "  {avg_frequency} GHz";
      interval = 2;
    };
    disk = {
      # path = "/";
      format = "󰋊 {percentage_used}%";
      interval = 60;
    };
    network = {
      format-wifi = "  {signalStrength}%";
      format-ethernet = "󰀂 ";
      tooltip-format = "Connected to {essid} {ifname} via {gwaddr}";
      format-linked = "{ifname} (No IP)";
      format-disconnected = "󰖪 ";
    };
    tray = {
      icon-size = 20;
      spacing = 8;
    };
    pulseaudio = {
      format = "{icon} {volume}%";
      format-muted = "󰖁  {volume}%";
      format-icons = {
        default = [ " " ];
      };
      scroll-step = 5;
      on-click = "pamixer -t";
    };
    battery = {
      format = "{icon} {capacity}%";
      format-icons = [
        " "
        " "
        " "
        " "
        " "
      ];
      format-charging = " {capacity}%";
      format-full = " {capacity}%";
      format-warning = " {capacity}%";
      interval = 5;
      states = {
        warning = 20;
      };
      format-time = "{H}h{M}m";
      tooltip = true;
      tooltip-format = "{time}";
    };
    temperature = {
      hwmon-path = "/sys/class/hwmon/hwmon5/temp1_input";
      format = " {temperatureC}°C";
      interval = 10;
    };
    backlight = {
      device = "amdgpu_bl1";
      format = "{icon} {percent}%";
      format-icons = [
        "󰃞"
        "󰃟"
        "󰃠"
      ];
      tooltip = true;
      tooltip-format = "Brightness: {percent}%";
      on-scroll-up = "brightnessctl set 1%+";
      on-scroll-down = "brightnessctl set 1%-";
      smooth-scrolling-threshold = 1.0;
    };
    "custom/launcher" = {
      format = "";
      on-click = "fuzzel";
      on-click-right = "pkill fuzzel || wallpaper-picker";
      tooltip = "false";
    };
    "custom/notification" = {
      tooltip = false;
      format = "{icon}";
      format-icons = {
        notification = "<span foreground='#f38ba8'><sup></sup></span>   ";
        none = "   ";
        dnd-notification = "<span foreground='#f38ba8'><sup></sup></span>   ";
        dnd-none = "   ";
        inhibited-notification = "<span foreground='#f38ba8'><sup></sup></span>   ";
        inhibited-none = "   ";
        dnd-inhibited-notification = "<span foreground='#f38ba8'><sup></sup></span>   ";
        dnd-inhibited-none = "   ";
      };
      return-type = "json";
      exec-if = "which swaync-client";
      exec = "swaync-client -swb";
      on-click = "swaync-client -t -sw";
      on-click-right = "swaync-client -d -sw";
      escape = true;
    };
  };
}
