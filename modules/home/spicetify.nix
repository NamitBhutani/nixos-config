{
  config,
  pkgs,
  inputs,
  ...
}:
{
  imports = [
    inputs.spicetify-nix.homeManagerModules.default
  ];
  programs.spicetify =
    let
      spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.system};
    in
    {
      enable = true;
      enabledExtensions = with spicePkgs.extensions; [
        adblock
        hidePodcasts
        keyboardShortcut
        shuffle
        copyLyrics
      ];
      enabledCustomApps = with spicePkgs.apps; [
        marketplace
      ];
      theme = spicePkgs.themes.text;
      colorScheme = "CatppuccinMocha";
    };
}
