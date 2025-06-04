{ pkgs, ... }: 
{
    catppuccin = {
        starship.enable = true;
        btop.enable = true;
        gtk.gnomeShellTheme = true;
        gtk.enable = true;
        gtk.accent = "lavender";
    };
}
