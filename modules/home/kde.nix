{config, lib, pkgs, ...}: let
  upperFirst = str:
    (lib.toUpper (builtins.substring 0 1 str))
    + (builtins.substring 1 (builtins.stringLength str) str);
    
  importINI = file: let
    json = pkgs.runCommand "INItoJSON" {} ''
      ${pkgs.jc}/bin/jc --ini < ${file} > $out
    '';
  in
    lib.importJSON json;
in {
  options.theme.catppuccin.kde = {
    enable = lib.mkEnableOption "kde integration";
    flavor = lib.mkOption {
      type = lib.types.str;
      default = "mocha";
    };
    accent = lib.mkOption {
      type = lib.types.str;
      default = "lavender";
    };
  };

  config = let
    cfg = config.theme.catppuccin.kde;
    package = pkgs.catppuccin-kde.override {
      flavour = [cfg.flavor];
      accents = [cfg.accent];
    };
    accent = upperFirst cfg.accent;
    flavor = upperFirst cfg.flavor;
    themeInfo = lib.mkMerge [
      (importINI "${package}/share/color-schemes/Catppuccin${flavor}${accent}.colors")
      {"ColorEffects:Disabled".IntensityAmount = lib.mkForce 1;}
    ];
  in
    lib.mkIf cfg.enable {
      home.packages = [package];
      qt.kde.settings.kdeglobals = themeInfo;
    };
}
