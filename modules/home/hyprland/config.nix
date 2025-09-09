{ pkgs, ... }:
{
  wayland.windowManager.hyprland = {
    settings = {
      # autostart
      exec-once = [
        "systemctl --user import-environment &"
        "hash dbus-update-activation-environment 2>/dev/null &"
        "dbus-update-activation-environment --systemd &"
        "nm-applet &"
        "swaync-wrapped &"
        #"wl-clipboard-history -t"
        "wl-clip-persist --clipboard both"
        "wl-paste --watch cliphist store &"
        "hyprshade on vibrance-boosted"
        "swaybg -m fill -i $(find ~/Pictures/wallpapers/ -maxdepth 1 -type f) &"
        "hyprlock"
        "hyprctl setcursor Nordzy-cursors 22 &"
        "poweralertd &"
        "waybar &"
        # "mcontrolcenter &"
        # "refresh-rate &"
      ];

      input = {
        kb_layout = "us";
        numlock_by_default = true;
        follow_mouse = 1;
        sensitivity = 0;
        touchpad = {
          natural_scroll = true;
        };
      };

      general = {
        "$mainMod" = "SUPER";
        layout = "dwindle";
        gaps_in = 2;
        gaps_out = 2;
        border_size = 2;
        "col.active_border" = "rgb(cba6f7) rgb(94e2d5) 45deg";
        "col.inactive_border" = "0x00000000";
        # border_part_of_window = false;
        no_border_on_floating = true;
      };

      gestures = {
        workspace_swipe = true;

      };

      misc = {
        disable_autoreload = true;
        disable_hyprland_logo = true;
        always_follow_on_dnd = true;
        layers_hog_keyboard_focus = true;
        animate_manual_resizes = false;
        enable_swallow = true;
        focus_on_activate = true;
        vfr = true;
      };
      cursor = {
        no_hardware_cursors = true;
      };
      dwindle = {
        #no_gaps_when_only = true;
        force_split = 0;
        special_scale_factor = 1.0;
        split_width_multiplier = 1.0;
        use_active_for_splits = true;
        pseudotile = "yes";
        preserve_split = "yes";
      };

      master = {
        special_scale_factor = 1;
        #no_gaps_when_only = false;
      };

      decoration = {
        rounding = 5;
        # active_opacity = 0.90;
        # inactive_opacity = 0.90;
        # fullscreen_opacity = 1.0;

        blur = {
          enabled = false;
        };
        # shadow = {
        #   enabled = false;
        # };

        # drop_shadow = true;

        # shadow_ignore_window = true;
        # shadow_offset = "0 2";
        # shadow_range = 20;
        # shadow_render_power = 3;
        # "col.shadow" = "rgba(00000055)";
      };

      animations = {
        enabled = true;

        bezier = [
          "fluent_decel, 0, 0.2, 0.4, 1"
          "easeOutCirc, 0, 0.55, 0.45, 1"
          "easeOutCubic, 0.33, 1, 0.68, 1"
          "easeinoutsine, 0.37, 0, 0.63, 1"
        ];

        animation = [
          "windowsIn, 1, 1, easeOutCubic, popin 30%"
          "windowsOut, 1, 1, easeOutCubic, popin 70%"
          "windowsMove, 1, 1, easeOutCubic, slide"
          "fadeIn, 1, 1, easeOutCubic"
          "fadeOut, 1, 1, easeOutCubic"
          "fadeSwitch, 0"
          "fadeShadow, 1, 1, easeOutCubic"
          "fadeDim, 1, 1, easeOutCubic"
          "border, 1, 1, easeOutCubic"
          "borderangle, 0" # disabled for performance
          "workspaces, 1, 1, easeOutCubic, fade"
        ];
      };

      bind = [
        # show keybinds list
        "$mainMod, F1, exec, -- show-keybinds"

        # keybindings
        "$mainMod, T, exec, zen --enable-features=UseOzonePlatform --ozone-platform=wayland"
        "$mainMod, Return, exec, wezterm"
        "ALT, Return, exec, wezterm --title float_wezterm"
        "$mainMod SHIFT, Return, exec, wezterm --start-as=fullscreen -o 'font_size=16'"
        "$mainMod, B, exec, hyprctl dispatch exec '[workspace 1 silent] floorp'"
        "$mainMod, Q, killactive,"
        "$mainMod, F, fullscreen, 0"
        "$mainMod SHIFT, F, fullscreen, 1"
        "$mainMod, Space, togglefloating,"
        "$mainMod, D, exec, fuzzel --launch-prefix=\"\""
        "$mainMod SHIFT, D, exec, hyprctl dispatch exec '[workspace 4 silent] discord'"
        "$mainMod SHIFT, S, exec, hyprctl dispatch exec '[workspace 5 silent] SoundWireServer'"
        "$mainMod, Escape, exec, hyprlock"
        "$mainMod SHIFT, Escape, exec, shutdown-script"
        "$mainMod, B, execr, hyprctl keyword monitor eDP-1,1920x1080@151,0x0,1.0"
        "$mainMod, P, pseudo,"
        "$mainMod, J, togglesplit,"
        "$mainMod, E, exec, nautilus"
        "$mainMod SHIFT, B, exec, pkill -SIGUSR1 .waybar-wrapped"
        "$mainMod, G,exec, $HOME/.local/bin/toggle_layout"
        "$mainMod, W,exec, pkill fuzzel || wallpaper-picker"
        "$mainMod SHIFT, W, exec, vm-start"
        "$mainMod, S, exec, rofimoji"

        # screenshot
        "$mainMod, Print, exec, grimblast --notify save area ~/Pictures/$(date +'%Y-%m-%d-At-%Ih%Mm%Ss').png"
        ",Print, exec, grimblast --notify copy area"

        # switch focus
        "$mainMod, left, movefocus, l"
        "$mainMod, right, movefocus, r"
        "$mainMod, up, movefocus, u"
        "$mainMod, down, movefocus, d"

        # switch workspace
        "$mainMod, 1, workspace, 1"
        "$mainMod, 2, workspace, 2"
        "$mainMod, 3, workspace, 3"
        "$mainMod, 4, workspace, 4"
        "$mainMod, 5, workspace, 5"
        "$mainMod, 6, workspace, 6"
        "$mainMod, 7, workspace, 7"
        "$mainMod, 8, workspace, 8"
        "$mainMod, 9, workspace, 9"
        "$mainMod, 0, workspace, 10"

        # move workspace to another monitor
        "$mainMod TAB, l, movecurrentworkspacetomonitor, l"
        "$mainMod TAB, r, movecurrentworkspacetomonitor, r"

        # same as above, but switch to the workspace
        "$mainMod SHIFT, 1, movetoworkspacesilent, 1" # movetoworkspacesilent
        "$mainMod SHIFT, 2, movetoworkspacesilent, 2"
        "$mainMod SHIFT, 3, movetoworkspacesilent, 3"
        "$mainMod SHIFT, 4, movetoworkspacesilent, 4"
        "$mainMod SHIFT, 5, movetoworkspacesilent, 5"
        "$mainMod SHIFT, 6, movetoworkspacesilent, 6"
        "$mainMod SHIFT, 7, movetoworkspacesilent, 7"
        "$mainMod SHIFT, 8, movetoworkspacesilent, 8"
        "$mainMod SHIFT, 9, movetoworkspacesilent, 9"
        "$mainMod SHIFT, 0, movetoworkspacesilent, 10"
        "$mainMod CTRL, c, movetoworkspace, empty"

        # window control
        "$mainMod SHIFT, left, movewindow, l"
        "$mainMod SHIFT, right, movewindow, r"
        "$mainMod SHIFT, up, movewindow, u"
        "$mainMod SHIFT, down, movewindow, d"
        "$mainMod CTRL, left, resizeactive, -80 0"
        "$mainMod CTRL, right, resizeactive, 80 0"
        "$mainMod CTRL, up, resizeactive, 0 -80"
        "$mainMod CTRL, down, resizeactive, 0 80"
        "$mainMod ALT, left, moveactive,  -80 0"
        "$mainMod ALT, right, moveactive, 80 0"
        "$mainMod ALT, up, moveactive, 0 -80"
        "$mainMod ALT, down, moveactive, 0 80"

        # media and volume controls
        ",XF86AudioRaiseVolume,exec, pamixer -i 2"
        ",XF86AudioLowerVolume,exec, pamixer -d 2"
        ",XF86AudioMute,exec, pamixer -t"
        ",XF86AudioPlay,exec, playerctl play-pause"
        ",XF86AudioNext,exec, playerctl next"
        ",XF86AudioPrev,exec, playerctl previous"
        ",XF86AudioStop, exec, playerctl stop"
        "$mainMod, mouse_down, workspace, e-1"
        "$mainMod, mouse_up, workspace, e+1"

        # laptop brigthness
        ",XF86MonBrightnessUp, exec, brightnessctl set 5%+"
        ",XF86MonBrightnessDown, exec, brightnessctl set 5%-"
        "$mainMod, XF86MonBrightnessUp, exec, brightnessctl set 100%+"
        "$mainMod, XF86MonBrightnessDown, exec, brightnessctl set 100%-"

        #clipboard manager
        "$mainMod, V, exec, cliphist list | fuzzel --dmenu | cliphist decode | wl-copy"

      ];

      # mouse binding
      bindm = [
        "$mainMod, mouse:272, movewindow"
        "$mainMod, mouse:273, resizewindow"
      ];

      # windowrule
      windowrule = [
        # "float,imv"
        # "center,imv"
        # "size 1200 725,imv"
        # "float,mpv"
        # "center,mpv"
        # "size 1200 725,mpv"
        "float,title:^(float_kitty)$"
        "center,title:^(float_kitty)$"
        "size 950 600,title:^(float_kitty)$"
        "float,title:^(File Upload)$"
        # "float,audacious"
        # "float,smile"
        # "workspace 8 silent, audacious"
        # "pin,wofi"
        # "float,wofi"
        # "noborder,wofi"
        # "tile, neovide"
        # "idleinhibit focus,mpv"
        # "float,udiskie"
        "float,title:^(Transmission)$"
        "float,title:^(Volume Control)$"
        "float,title:^(Firefox — Sharing Indicator)$"
        "move 0 0,title:^(Firefox — Sharing Indicator)$"
        "size 700 450,title:^(Volume Control)$"
        "move 40 55%,title:^(Volume Control)$"
      ];

      # windowrulev2
      windowrulev2 = [
        "float, title:^(Picture-in-Picture)$"
        "opacity 1.0 override 1.0 override, title:^(Picture-in-Picture)$"
        "pin, title:^(Picture-in-Picture)$"
        "opacity 1.0 override 1.0 override, title:^(.*imv.*)$"
        "opacity 1.0 override 1.0 override, title:^(.*mpv.*)$"
        "opacity 1.0 override 1.0 override, class:(Unity)"
        "idleinhibit focus, class:^(mpv)$"
        "idleinhibit fullscreen, class:^(firefox)$"
        "float,class:^(pavucontrol)$"
        "float,class:^(SoundWireServer)$"
        "float,class:^(.sameboy-wrapped)$"
        "float,class:^(file_progress)$"
        "float,class:^(confirm)$"
        "float,class:^(dialog)$"
        "float,class:^(download)$"
        "float,class:^(notification)$"
        "float,class:^(error)$"
        "float,class:^(confirmreset)$"
        "float,title:^(Open File)$"
        "float,title:^(branchdialog)$"
        "float,title:^(Confirm to replace files)$"
        "float,title:^(File Operation Progress)$"
        "float,class:Ulauncher"
        "noborder,class:Ulauncher"
        "workspace 5 silent, class:^(spotify)$"
        "workspace 5 silent, class:^(com.github.th_ch.youtube_music)$"
        "workspace 4 silent, class:^(discord)$"

      ];

    };

    extraConfig = "
      monitor = eDP-1, 1920x1080@240, 0x0, 1.0
      monitor = HDMI-A-1, 1920x1080@60, 1920x0, 1.333333


      xwayland {
        force_zero_scaling = true
      }
      $LAPTOP_KB_ENABLED = 1
      device {
  name = at-translated-set-2-keyboard
  enabled = $LAPTOP_KB_ENABLED
}
    ";
  };
}
