{ ... }:
{
  programs.fuzzel = {
    enable = true;
    settings = {
      main = {
        width = 35;
        terminal = "wezterm -e";
        font = "JetBrainsMono Nerd Font Mono:size=12";
        anchor = "center";
        use-bold = "yes";
        icon-theme = "Papirus-Dark";
        icons-enabled = true;
        vertical-pad = 8;
        line-height = 20;
        horizontal-pad = 16;
        inner-pad = 8;
        lines = 15;
        tabs = 4;
      };

      border = {
        width = 2;
        radius = 8;
      };
    };
  };
}
