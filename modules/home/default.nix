{
  inputs,
  username,
  host,
  ...
}:
{
  imports = [
    ./audacious/audacious.nix # music player
    ./bat.nix # better cat command
    ./btop.nix # resouces monitor
    ./discord.nix # discord with catppuccin theme
    ./browser/zen.nix
    ./git.nix # version control
    ./gtk.nix # gtk theme
    ./hyprland # window manager
    ./micro.nix # nano replacement
    ./nvim/nvim.nix # neovim editor
    ./packages.nix # other packages
    ./dev.nix # systems & graphics dev tooling
    ./scripts/scripts.nix # personal scripts
    ./starship.nix # shell prompt
    ./hyprlock.nix # lock screen
    ./hypridle.nix # idle daemon: screen off + suspend on battery
    ./swaync/swaync.nix # notification center
    # ./vscode.nix # vscode
    ./waybar # status bar
    ./fuzzel.nix # launcher
    ./fish.nix # shell
    ./spicetify.nix # spicetify
    ./catppuccin.nix
    ./qt.nix # qt theme
    ./kitty.nix # terminal emulator
    ./tmux.nix
    ./gammastep.nix # blue light filter
    ./ytm/ytm.nix # youtube music
    ./zed.nix # zed editor
  ];

}
