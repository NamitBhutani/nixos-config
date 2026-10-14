{ pkgs, ... }:
{
  home.packages = with pkgs; [
    sesh
    gum
  ];

  programs.tmux = {
    enable = true;
    clock24 = true;
    baseIndex = 1;
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
      set -g renumber-windows on

      set -g mouse on

      set -g default-terminal "tmux-256color"
      set -ag terminal-overrides ",xterm-256color:RGB"

      set -s set-clipboard on

      bind-key x kill-pane
      bind-key & kill-window

      set -g detach-on-destroy off

      bind-key "K" display-popup -E -w 40% -h 60% "sesh connect \"$(sesh list | gum filter --placeholder 'Pick a session')\""
    '';
  };

}
