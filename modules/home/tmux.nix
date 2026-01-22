{ pkgs, ... }:
{
  home.packages = with pkgs; [
    sesh
    gum
  ];

  programs.tmux = {
    enable = true;
    clock24 = true;
    baseIndex = 0;
    escapeTime = 0;
    keyMode = "vi";
    prefix = "C-b";
    terminal = "screen-256color";

    plugins = with pkgs.tmuxPlugins; [
      sensible
      resurrect
      continuum
      yank
    ];

    extraConfig = ''
      # Enable mouse support
      set -g mouse on

      # Better colors for WezTerm
      set -g default-terminal "tmux-256color"
      set -ag terminal-overrides ",xterm-256color:RGB"

      # Clipboard integration
      set -s set-clipboard on

      # Better session switching
      set -g detach-on-destroy off

      # Sesh session manager keybinding
      # Ctrl+B K to open sesh
      bind-key "K" display-popup -E -w 40% -h 60% "sesh connect \"$(sesh list | gum filter --placeholder 'Pick a session')\""
    '';
  };

}
