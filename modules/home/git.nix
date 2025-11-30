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
    };
  };

  # home.packages = [ pkgs.gh pkgs.git-lfs ];
}
