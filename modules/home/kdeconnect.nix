{ config, pkgs, ... }:

{
  # ───────────────────────────────────────────────────────────────
  # 1) Enable KDE Connect via Home Manager for user “username”
  # ───────────────────────────────────────────────────────────────
  home-manager.users.username = {
    services.kdeconnect.enable = true;
  };

  # ───────────────────────────────────────────────────────────────
  # 2) Open TCP/UDP ports 1714–1764 in the built-in firewall
  # ───────────────────────────────────────────────────────────────
  networking.firewall = rec {
    # allow TCP ports 1714 to 1764
    allowedTCPPortRanges = [
      { from = 1714; to = 1764; }
    ];

    # use the same ranges for UDP
    allowedUDPPortRanges = allowedTCPPortRanges;
  };
}
