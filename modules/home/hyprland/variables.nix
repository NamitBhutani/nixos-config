{ ... }:
{
  home.sessionVariables = {
    SSH_AUTH_SOCK = "/run/user/1000/keyring/ssh";
    DISABLE_QT5_COMPAT = "0";
    GDK_BACKEND = "wayland";
    #GBM_BACKEND = "mesa";
    #LIBVA_DRIVER_NAME = "radeonsi";
    DIRENV_LOG_FORMAT = "";
    QT_AUTO_SCREEN_SCALE_FACTOR = "1";
    QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
    #QT_QPA_PLATFORM = "xcb";
    XDG_SESSION_TYPE = "wayland";
    GTK_THEME = "Catppuccin-Mocha-Compact-Lavender-Dark";
    WLR_NO_HARDWARE_CURSORS = "1";
    # iGPU first, dGPU second; by-path names because cardN numbering shifts with probe order
    AQ_DRM_DEVICES = "/dev/dri/by-path/pci-0000:00:02.0-card:/dev/dri/by-path/pci-0000:01:00.0-card";
  };
}
