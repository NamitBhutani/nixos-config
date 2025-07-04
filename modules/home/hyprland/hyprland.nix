{ inputs, pkgs, ... }:
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
  services.hyprpolkitagent.enable = true;
  # systemd.user.targets.hyprland-session.Unit.Wants = [ "xdg-desktop-autostart.target" ];
  wayland.windowManager.hyprland = {
    enable = true;
    xwayland = {
      enable = true;
      # hidpi = true;
    };

    # settings = {
    #   env = [
    #     "GDK_BACKEND, wayland"
    #     "VDPAU_DRIVER,va_gl"
    #     "LIBVA_DRIVER_NAME, iHD"
    #   ];
    # };
    #enableNvidiaPatches = false;
    systemd.enable = false;
  };
}
