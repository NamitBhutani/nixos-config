{
  inputs,
  system,
  pkgs,
  lib,
  ...
}:
{
  programs.hyprland.enable = true;

  #programs.hyprland.package = inputs.hyprland.packages.${system}.hyprland;
  xdg.portal = {
    enable = true;
    xdgOpenUsePortal = true;
    extraPortals = [
      pkgs.xdg-desktop-portal-hyprland
      pkgs.xdg-desktop-portal-gtk
    ];
    config = {
      common.default = [ "hyprland" ];
      common."org.freedesktop.impl.portal.FileChooser" = [ "gtk" ];
    };
  };
}
