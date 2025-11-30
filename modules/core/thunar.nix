{ pkgs, ... }:
{
  programs.thunar = {
    enable = true;
    plugins = with pkgs.xfce; [
      thunar-volman # Removable drives/media management
      thunar-archive-plugin # Archive file support (extract/compress)
      thunar-media-tags-plugin # Media file tagging
      thunar-vcs-plugin
    ];
  };
}
