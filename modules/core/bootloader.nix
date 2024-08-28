{ pkgs, ... }:
{
  #boot.loader.systemd-boot.enable = true;
  boot.loader.grub = {
      enable = true;
      devices = [ "nodev" ];
      efiSupport = true;
      useOSProber = true;
      splashImage = ./pxfuel.png;
    };
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.systemd-boot.configurationLimit = 10;
  boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.kernelParams = [
    "nvidia_drm.fbdev=1" "nvidia-drm.modeset=1" "ec_sys.write_support=1"
  ];  
}
