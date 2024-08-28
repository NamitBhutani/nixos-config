{ pkgs, ... }: 
{
  home.packages = with pkgs; [ microsoft-edge floorp ];

  # nixpkgs.overlays = [
  #   (final: prev: {
  #     microsoft-edge = prev.microsoft-edge.overrideAttrs (oldAttrs: {
  #       buildInputs = (oldAttrs.buildInputs or []) ++ [ prev.makeWrapper ];

  #       installPhase = (oldAttrs.installPhase or "") + ''wrapProgram $out/bin/microsoft-edge --add-flags "--enable-features=UseOzonePlatform --ozone-platform=wayland"'';
  #     });
  #   })
  # ];
}
