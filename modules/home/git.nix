{ pkgs, ... }: 
{
  programs.git = {
    enable = true;
    
    userName = "Namit Bhutani";
    userEmail = "namit.bhut@gmail.com";
    
    extraConfig = { 
      init.defaultBranch = "main";
      credential.helper = "store";
    };
  };

  # home.packages = [ pkgs.gh pkgs.git-lfs ];
}
