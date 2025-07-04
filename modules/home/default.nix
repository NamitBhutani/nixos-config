{
  inputs,
  username,
  host,
  ...
}:
{
  imports =
    [ (import ./audacious/audacious.nix) ] # music player
    ++ [ (import ./bat.nix) ] # better cat command
    ++ [ (import ./btop.nix) ] # resouces monitor
    ++ [ (import ./discord.nix) ] # discord with catppuccin theme
    ++ [ (import ./browser/zen.nix) ]
    ++ [ (import ./git.nix) ] # version control
    ++ [ (import ./gtk.nix) ] # gtk theme
    ++ [ (import ./hyprland) ] # window manager
    ++ [ (import ./micro.nix) ] # nano replacement
    ++ [ (import ./nvim/nvim.nix) ] # neovim editor
    ++ [ (import ./packages.nix) ] # other packages
    ++ [ (import ./scripts/scripts.nix) ] # personal scripts
    ++ [ (import ./starship.nix) ] # shell prompt
    ++ [ (import ./swaylock.nix) ] # lock screen
    ++ [ (import ./swaync/swaync.nix) ] # notification center
    ++ [ (import ./vscode.nix) ] # vscode
    ++ [ (import ./waybar) ] # status bar
    ++ [ (import ./fuzzel.nix) ] # launcher
    ++ [ (import ./zsh.nix) ] # shell
    ++ [ (import ./spicetify.nix) ] # spicetify
    ++ [ (import ./catppuccin.nix) ]
    ++ [ (import ./qt.nix) ] # qt theme
    ++ [ (import ./wezterm/wezterm.nix) ]; # terminal

}
