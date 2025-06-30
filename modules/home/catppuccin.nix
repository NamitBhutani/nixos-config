{ pkgs, ... }: 
{
    catppuccin = {
        enable = true;
        kvantum.apply = true;
        flavor = "mocha";
        accent = "lavender";
        gtk.gnomeShellTheme = true;
        gtk.enable = true;
    };
}
