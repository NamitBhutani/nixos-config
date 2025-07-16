{ pkgs, ... }:
{
  home = {
    packages = [
      (pkgs.writeShellScriptBin "swaync-wrapped" ''
        XDG_CONFIG_HOME="$HOME/.dummy" ${pkgs.swaynotificationcenter}/bin/swaync \
          -c "$HOME/.config/swaync/config.json" \
          -s "$HOME/.config/swaync/style.css"
      '')
    ];

    file = {
      ".config/swaync/style.css".source = ./style.css;
      ".config/swaync/config.json".source = ./config.json;
    };
  };
}
