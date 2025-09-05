{ config, pkgs, ... }:
{
  services = {
    mako.settings = {
      enable = true;
      font = "JetBrainsMono Nerd Font 12";
      padding = "15";
      default-timeout = 5000;
      border-size = 2;
      border-radius = 5;
      background-color = "#1e1e2e";
      #borderColor = "#b4befe";
      progress-color = "over #313244";
      text-color = "#cdd6f4";
      icons = true;
      actions = true;
      # settings = ''
      #   text-alignment=center
      #   [urgency=high]
      #   default-timeout=100000000
      #   border-color=#fab387
      # '';
    };
  };
}
