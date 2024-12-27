{ pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    vimAlias = true;
  };

  home.file.".config/nvim" = {
    source = ./nvim-config;
    recursive = true;
  };
}
