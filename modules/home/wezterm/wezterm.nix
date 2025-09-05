{ config, pkgs, ... }:

{
  # home.packages = [
  #   weztermPkg
  # ];

  home.file.".config/wezterm/wezterm.lua".source = ./wezterm.lua;
}
