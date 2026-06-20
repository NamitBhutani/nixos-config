{ pkgs, ... }:
{
  programs.git = {
    enable = true;
    lfs.enable = true;
    settings.user = {
      name = "Namit Bhutani";
      email = "namit.bhut@gmail.com";
    };

    settings = {
      init.defaultBranch = "main";
      credential.helper = "store";
      merge.conflictstyle = "diff3";
      diff.colorMoved = "default";
    };
  };

  programs.delta = {
    enable = true;
    options = {
      navigate = true;       # n/N to jump between diff sections
      side-by-side = true;
      line-numbers = true;
      syntax-theme = "Dracula";
    };
  };

  # gh CLI — manage PRs, issues, repos from the terminal
  home.packages = [ pkgs.gh ];
}
