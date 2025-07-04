{ pkgs, ... }:
{
  imports = [ ./kde.nix ];

  qt = {
    enable = true;
    platformTheme.name = "kvantum";
    style = {
      name = "kvantum";
    };
  };

  theme.catppuccin.kde = {
    enable = true;
    flavor = "mocha";
    accent = "lavender";
  };
}
