{ inputs, pkgs, ... }:
{
  home.packages = (
    with pkgs;
    [
      eza # ls replacement
      entr # perform action when file change
      fd # find replacement
      file # Show file information
      fzf
      wezterm
      # gtt                               # google translate TUI
      gtrash # rm replacement, put deleted files in system trash
      jdk17 # java
      libreoffice
      nautilus # file manager
      nitch # systhem fetch util
      nix-prefetch-github
      ripgrep # grep replacement
      soundwireserver # pass audio to android phone
      yazi # terminal file manager
      wl-clipboard # wayland clipboard manager
      cliphist # clipboard history
      # C / C++
      gcc
      gnumake

      # Python
      python3

      bleachbit # cache cleaner
      cmatrix
      gparted # partition manager
      imv # image viewer
      libnotify
      man-pages # extra man pages
      mpv # video player
      ncdu # disk space
      openssl
      obsidian
      pamixer # pulseaudio command line mixer
      pavucontrol # pulseaudio volume controle (GUI)
      playerctl # controller for media players
      poweralertd
      qalculate-gtk # calculator
      unzip
      wget
      xdg-utils
      xxd
      linux-wifi-hotspot
      youtube-music
      undervolt
      unityhub
      hostapd
      iw
      #godot_4
      #whatsapp-for-linux
      cmake
      rofimoji
      hotspot
      cachix
      # blender
      swaynotificationcenter
      #whatsie
    ]
  );
}
