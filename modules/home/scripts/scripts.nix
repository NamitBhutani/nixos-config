{ pkgs, ... }:
let
  wall-change = pkgs.writeShellScriptBin "wall-change" ''swaybg -m fill -i $1'';
  wallpaper-picker = pkgs.writeShellScriptBin "wallpaper-picker" (
    builtins.readFile ./scripts/wallpaper-picker.sh
  );

  runbg = pkgs.writeShellScriptBin "runbg" (builtins.readFile ./scripts/runbg.sh);
  music = pkgs.writeShellScriptBin "music" (builtins.readFile ./scripts/music.sh);

  maxfetch = pkgs.writeScriptBin "maxfetch" (builtins.readFile ./scripts/maxfetch.sh);

  compress = pkgs.writeScriptBin "compress" (builtins.readFile ./scripts/compress.sh);
  extract = pkgs.writeScriptBin "extract" (builtins.readFile ./scripts/extract.sh);

  shutdown-script = pkgs.writeScriptBin "shutdown-script" (
    builtins.readFile ./scripts/shutdown-script.sh
  );
  refresh-rate = pkgs.writeScriptBin "refresh-rate" (builtins.readFile ./scripts/refresh-rate.sh);
  show-keybinds = pkgs.writeScriptBin "show-keybinds" (builtins.readFile ./scripts/keybinds.sh);

  toggle-keyboard = pkgs.writeScriptBin "toggle-keyboard" (
    builtins.readFile ./scripts/toggle-keyboard.sh
  );
  ascii = pkgs.writeScriptBin "ascii" (builtins.readFile ./scripts/ascii.sh);
in
{
  home.packages = with pkgs; [
    wall-change
    wallpaper-picker

    runbg

    toggle-keyboard

    maxfetch

    compress
    extract

    shutdown-script
    refresh-rate
    show-keybinds

    ascii
  ];
}
