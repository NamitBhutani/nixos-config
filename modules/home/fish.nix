{
  hostname,
  config,
  pkgs,
  lib,
  host,
  ...
}:
{
  programs.fish = {
    enable = true;

    shellInit = ''
      set -gx MICRO_TRUECOLOR 1
      set -g fish_greeting ""
      set -g fish_escape_delay_ms 10
      set -g __fish_git_prompt_show_informative_status 0
      set -g __fish_git_prompt_hide_untrackedfiles 1
    '';

    shellAliases = {

      # Utils
      cd = "z";
      rm = "gtrash put";
      cat = "bat";
      nano = "micro";
      find = "fd";
      grep = "rg --smart-case";
      code = "uwsm-app -- code";

      ls = "eza --icons --group-directories-first";
      la = "eza --icons -a --group-directories-first";
      ll = "eza --icons -a --group-directories-first --no-user --long";
      tree = "eza --icons --tree --group-directories-first";

      # Nixos
      ns = "nix-shell --run fish";
      nix-shell = "nix-shell --run fish";
      nix-switch = "sudo nixos-rebuild switch --flake ~/nixos-config#${host}";
      nix-switchu = "sudo nixos-rebuild switch --upgrade --flake ~/nixos-config#${host}";
      nix-clean = "sudo nix-collect-garbage && sudo nix-collect-garbage -d && sudo rm /nix/var/nix/gcroots/auto/* && nix-collect-garbage && nix-collect-garbage -d";
    };
  };

  programs.zoxide = {
    enable = true;
    enableFishIntegration = true;
  };
}
