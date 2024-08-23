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
    package = pkgs.sunshine.override { cudaSupport=true; };
    enable = true;
    autoStart = false;
    capSysAdmin = true;
    openFirewall = true;
  };
  services = {
    syncthing = {
        enable = true;
        user = "intellomaniac";
        dataDir = "/home/intellomaniac/Documents/obsidian-vault";    # Default folder for new synced folders
        configDir = "/home/intellomaniac/Documents/.config/syncthing";   # Folder for Syncthing's settings and keys
    };
};

}
