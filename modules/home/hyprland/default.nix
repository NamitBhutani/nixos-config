{ inputs, ... }:
{
  imports = [
    (import ./hyprland.nix)
  ]
  ++ [ (import ./config.nix) ]
  ++ [ (import ./variables.nix) ]
  ++ [ (import ./vibrance.nix) ];
  # ++ [ inputs.hyprland.homeManagerModules.default ];
}
