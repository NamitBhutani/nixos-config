{ pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    vimAlias = true;
  };

  home.file.".config/nvim" = {
    source = ./config;
    recursive = true;
  };
}
