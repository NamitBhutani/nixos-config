{ ... }:
{
  home.sessionVariables = {
    #NIXOS_OZONE_WL = "1";
    __GLX_VENDOR_LIBRARY_NAME = "nvidia";
   # _JAVA_AWT_WM_NONEREPARENTING = "1";
    SSH_AUTH_SOCK = "/run/user/1000/keyring/ssh";
    DISABLE_QT5_COMPAT = "0";
    GDK_BACKEND = "wayland";
    GBM_BACKEND = "nvidia-drm";
    LIBVA_DRIVER_NAME="nvidia";
   # ANKI_WAYLAND = "1";
    DIRENV_LOG_FORMAT = "";
  #  WLR_DRM_NO_ATOMIC = "1";
    QT_AUTO_SCREEN_SCALE_FACTOR = "1";
    QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
    QT_QPA_PLATFORM = "xcb";
    QT_QPA_PLATFORMTHEME = "qt5ct";
    QT_STYLE_OVERRIDE = "kvantum";
    #LAPTOP_KB_ENABLED = 1;
   # MOZ_ENABLE_WAYLAND = "1";
   # WLR_NO_HARDWARE_CURSORS = "1";
    XDG_SESSION_TYPE = "wayland";
  #  SDL_VIDEODRIVER = "wayland";
   # CLUTTER_BACKEND = "wayland";
    GTK_THEME = "Catppuccin-Mocha-Compact-Lavender-Dark";
    #WLR_DRM_DEVICES="$HOME/.config/hypr/card";
  };
}
