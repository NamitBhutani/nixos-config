{ pkgs, ... }:
{
  catppuccin = {
    enable = true;
    kvantum.apply = true;
    flavor = "mocha";
    accent = "lavender";
    gtk.enable = true;
    nvim.enable = false;
    delta.enable = false;
  };
}
