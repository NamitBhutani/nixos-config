{ pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    vimAlias = true;
    withRuby = true;
    withPython3 = true;
  };

  home.file.".config/nvim" = {
    source = ./nvim-config;
    recursive = true;
  };
}
