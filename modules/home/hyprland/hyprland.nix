{ inputs, pkgs, ...}: 
{
  home.packages = with pkgs; [
    # swww
    swaybg
    inputs.hypr-contrib.packages.${pkgs.system}.grimblast
    hyprshade
    grim
    slurp
    wl-clip-persist
    wf-recorder
    glib
    wayland
    direnv
  ];
  systemd.user.targets.hyprland-session.Unit.Wants = [ "xdg-desktop-autostart.target" ];
  wayland.windowManager.hyprland = {
    enable = true;
    xwayland = {
      enable = true;
      # hidpi = true;
    };
    settings = {
      env = [
        "NIXOS_OZONE_WL, 1"
        "AQ_DRM_DEVICES, /dev/dri/card1"
      ];
    };
    #enableNvidiaPatches = false;
    systemd.enable = true;
  };
}
