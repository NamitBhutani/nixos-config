{ ... }:
{
  home.file = {
  ".config/uwsm/env".text = ''
    export NIXOS_OZONE_WL=1
    export WLR_NO_HARDWARE_CURSORS=1
    export QT_AUTO_SCREEN_SCALE_FACTOR=1
    export QT_WAYLAND_DISABLE_WINDOWDECORATION=1
    export QT_QPA_PLATFORM=wayland;xcb
    export QT_QPA_PLATFORMTHEME=kvantum
    export QT_STYLE_OVERRIDE=kvantum
    export GDK_BACKEND=wayland
    export SSH_AUTH_SOCK=/run/user/1000/keyring/ssh
    export DISABLE_QT5_COMPAT=0
    export DIRENV_LOG_FORMAT=""
  '';
  
  ".config/uwsm/env-hyprland".text = ''
    export AQ_DRM_DEVICES=/dev/dri/card1
  '';
};
home.sessionVariables = {
      GTK_THEME="Catppuccin-Mocha-Compact-Lavender-Dark";
};
}
