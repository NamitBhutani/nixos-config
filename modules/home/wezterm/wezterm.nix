{ config, pkgs, inputs, ... }:
let
  # Import WezTerm from the flake input
  weztermPkg = inputs.wezterm.packages.${pkgs.system}.default;
in
{
  home.packages = [
    weztermPkg
  ];
  home.file.".config/wezterm/wezterm.lua".source = ./wezterm.lua;
}
