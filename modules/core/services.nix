{ pkgs, ... }: 
{
  services = {
    gvfs.enable = true;
    gnome.gnome-keyring.enable = true;
    dbus.enable = true;
    fstrim.enable = true;
  };
  services.logind.extraConfig = ''
    # don’t shutdown when power button is short-pressed
    HandlePowerKey=ignore
  '';
    services.sunshine = {
    package = pkgs.sunshine.override { cudaSupport = true;  };
    enable = true;
    autoStart = false;
    capSysAdmin = true;
    openFirewall = true;
  };

  
  services = {
    # syncthing = {
    #     enable = true;
    #     user = "intellomaniac";
    #     dataDir = "/home/intellomaniac/Documents/obsidian-vault";    # Default folder for new synced folders
    #     configDir = "/home/intellomaniac/Documents/.config/syncthing";   # Folder for Syncthing's settings and keys
    # };
    cloudflare-warp.enable = true;
};

systemd = {
  user.services.polkit-gnome-authentication-agent-1 = {
    description = "polkit-gnome-authentication-agent-1";
    wantedBy = [ "graphical-session.target" ];
    wants = [ "graphical-session.target" ];
    after = [ "graphical-session.target" ];
    serviceConfig = {
        Type = "simple";
        ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
        Restart = "on-failure";
        RestartSec = 1;
        TimeoutStopSec = 10;
      };
  };
};

}
