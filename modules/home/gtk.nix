{ config, pkgs, ... }:
{
  fonts.fontconfig.enable = true;
  home.packages = [
    pkgs.nerd-fonts.jetbrains-mono
    #(pkgs.nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
    pkgs.twemoji-color-font
    pkgs.noto-fonts-color-emoji
  ];
  gtk = {
    enable = true;
    gtk4.theme = config.gtk.theme;
    font = {
      name = "JetBrainsMono Nerd Font";
      size = 11;
    };
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.catppuccin-papirus-folders.override {
        flavor = "mocha";
        accent = "lavender";
      };
    };

    cursorTheme = {
      name = "Nordzy-cursors";
      package = pkgs.nordzy-cursor-theme;
      size = 22;
    };
  };

  home.pointerCursor = {
    name = "Nordzy-cursors";
    package = pkgs.nordzy-cursor-theme;
    size = 22;
  };
}
