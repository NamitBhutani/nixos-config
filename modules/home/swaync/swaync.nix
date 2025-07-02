{ pkgs, ... }:
{
  home.file.".config/swaync/style.css".source = ./style.css;
  home.file.".config/swaync/config.json".source = ./config.json;
}