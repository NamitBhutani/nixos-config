{ inputs, pkgs, ... }:
{
  home.packages = (
    with pkgs;
    [
      eza
      entr
      fd
      file
      fzf
      houdini
      antigravity-cli
      google-chrome
      slack
      # gtt                               # google translate TUI
      gtrash
      jdk17
      libreoffice
      #nautilus # file manager
      nitch
      nix-prefetch-github
      ripgrep
      soundwireserver
      yazi
      wl-clipboard
      cliphist
      gcc
      gnumake

      python3

      bleachbit
      cmatrix
      gparted
      imv
      libnotify
      man-pages
      mpv
      ncdu
      openssl
      obsidian
      pamixer
      pavucontrol
      playerctl
      poweralertd
      qalculate-gtk
      unzip
      wget
      xdg-utils
      xxd
      linux-wifi-hotspot
      pear-desktop
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
