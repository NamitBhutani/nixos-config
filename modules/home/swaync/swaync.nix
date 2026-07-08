{ ... }:
{
  catppuccin.swaync.enable = false;

  services.swaync = {
    enable = true;
    style = ./style.css;
    settings = builtins.fromJSON (builtins.readFile ./config.json);
  };
}
