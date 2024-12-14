{ pkgs, ... }:
{
  fonts.fontconfig.enable = true;
 home.packages = [
   pkgs.nerd-fonts.jetbrains-mono
   #(pkgs.nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
   pkgs.twemoji-color-font
   pkgs.noto-fonts-emoji
 ];
    catppuccin = {
      enable = true;
      accent = "lavender";
    };
  gtk = {
    enable = true;
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
    catppuccin = {
      enable = true;
      accent = "lavender";
      gnomeShellTheme = true;
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
