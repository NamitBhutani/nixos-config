{
  pkgs,
  lib,
  config,
  inputs,
  ...
}:
{

  programs.hyprlock = {
    enable = true;
    settings = {
      general = {
        disable_loading_bar = true;
        grace = 300;
        hide_cursor = true;
        no_fade_in = false;
      };

      background = [
        {
          path = "screenshot";
          blur_passes = 1;
          blur_size = 4;
        }
      ];
    };
  };
}
