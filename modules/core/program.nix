{ pkgs, ... }:
{
  programs.dconf.enable = true;
  programs.kdeconnect.enable = true;
  programs.zsh.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
    # pinentryFlavor = "";
  };
}
