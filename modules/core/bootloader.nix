{ pkgs, ... }:
{
  #boot.loader.systemd-boot.enable = true;
  boot.loader.grub = {
      enable = true;
      devices = [ "nodev" ];
      efiSupport = true;
      useOSProber = true;
      # catppuccin = {
      #   enable = true;
      #   flavor = "mocha";
      # };
    };
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.systemd-boot.configurationLimit = 10;
  boot.kernelPackages = pkgs.linuxKernel.packages.linux_6_12;
  boot.kernelParams = [
    "nvidia_drm.fbdev=1" "nvidia-drm.modeset=1" "ec_sys.write_support=1"
  ];  
}
