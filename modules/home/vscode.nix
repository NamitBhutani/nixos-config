{ pkgs, ... }:
{
  programs.vscode = {
    enable = true;
    package = pkgs.vscode.fhs;
    userSettings = {
      "window.newWindowProfile" = "VSCode Stable";
    };
  };
}
