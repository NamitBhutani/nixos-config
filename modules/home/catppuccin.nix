{ pkgs, ... }:
{
  catppuccin = {
    enable = true;
    kvantum.apply = true;
    flavor = "mocha";
    accent = "lavender";
    gtk.enable = true;
  };
}
