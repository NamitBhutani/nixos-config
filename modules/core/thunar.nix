{ pkgs, ... }:
{
  programs.thunar = {
    enable = true;
    plugins = with pkgs; [
      thunar-volman
      thunar-archive-plugin
      thunar-media-tags-plugin
      thunar-vcs-plugin
    ];
  };

  environment.systemPackages = with pkgs; [
    file-roller
  ];
}
