{ ... }:

{
  programs.neovim = {
    enable = true;
    vimAlias = true;
    withRuby = true;
    withPython3 = true;
    initLua = builtins.readFile ./nvim-config/init.lua;
  };

  xdg.configFile."nvim/lua".source = ./nvim-config/lua;
}
