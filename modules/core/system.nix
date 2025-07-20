{
  self,
  pkgs,
  lib,
  inputs,
  ...
}:
{
  # imports = [ inputs.nix-gaming.nixosModules.default ];
  nix = {
    settings = {
      auto-optimise-store = true;
      experimental-features = [
        "nix-command"
        "flakes"
      ];
      substituters = [ "https://wezterm.cachix.org" ];
      trusted-substituters = [ "https://wezterm.cachix.org" ];
      trusted-public-keys = [ "wezterm.cachix.org-1:kAbhjYUC9qvblTE+s7S+kl5XM1zVa4skO+E/1IDWdH0=" ];
    };
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
  };

  environment.systemPackages = with pkgs; [
    pulseaudio
    git
  ];

  time.timeZone = lib.mkDefault "Asia/Kolkata";
  time.hardwareClockInLocalTime = true;
  i18n.defaultLocale = "en_US.UTF-8";
  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.cudaSupport = lib.mkForce true;
  system.stateVersion = "23.11";
}
