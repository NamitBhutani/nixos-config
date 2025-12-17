{ pkgs, ... }:
{
  programs.dconf.enable = true;
  programs.kdeconnect.enable = true;
  programs.fish.enable = true;
  programs.nix-ld.enable = true;
  programs.direnv = {
    enable = true;
    enableFishIntegration = true;  # or zshIntegration
    nix-direnv.enable = true;
  };
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  #   # pinentryFlavor = "";
  # };
}
