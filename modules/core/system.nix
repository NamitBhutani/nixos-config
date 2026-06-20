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
      auto-optimise-store = true;
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
    perf  # kernel-matched perf (replaces deprecated linuxPackages.perf)
  ];

  # Required for perf, rr (time-travel debugger), and bpftrace
  boot.kernel.sysctl = {
    "kernel.perf_event_paranoid" = 1;  # Allow perf by non-root (0 = full access, 1 = no raw tracepoints)
    "kernel.kptr_restrict" = 0;        # Expose kernel addresses for symbol resolution in perf/rr
  };

  time.timeZone = lib.mkDefault "Asia/Kolkata";
  time.hardwareClockInLocalTime = true;
  i18n.defaultLocale = "en_US.UTF-8";
  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.cudaSupport = lib.mkForce true;
  system.stateVersion = "23.11";
}
