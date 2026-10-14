{
  self,
  pkgs,
  lib,
  config,
  inputs,
  ...
}:
{
  # imports = [ inputs.nix-gaming.nixosModules.default ];
  nix = {
    settings = {
      auto-optimise-store = false;
      experimental-features = [
        "nix-command"
        "flakes"
      ];
      substituters = [
        "https://cache.nixos.org"
        "https://cuda-maintainers.cachix.org"
      ];
      trusted-public-keys = [
        "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
        "cuda-maintainers.cachix.org-1:0dq3bujKpuEPMCX6U4WylrUDZ9JyUG0VpVZa7CNfq5E="
      ];
      http-connections = 50;
      connect-timeout = 5;
      min-free = 2147483648;
      max-free = 8589934592;
    };
    optimise = {
      automatic = true;
      dates = [ "weekly" ];
    };
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
  };

  systemd.services.mandb.wantedBy = lib.mkForce [ ];
  systemd.timers.mandb = {
    wantedBy = [ "timers.target" ];
    timerConfig.OnBootSec = "5min";
  };

  environment.systemPackages = with pkgs; [
    pulseaudio
    git
    perf
  ];

  boot.kernel.sysctl = {
    "kernel.perf_event_paranoid" = 1;
    "kernel.kptr_restrict" = 0;
  };

  time.timeZone = lib.mkDefault "America/Toronto";
  time.hardwareClockInLocalTime = false;
  i18n.defaultLocale = "en_US.UTF-8";
  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.cudaSupport = lib.mkForce true;
  system.stateVersion = "23.11";
}
