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
  boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.kernelParams = [
    "ec_sys.write_support=1"
  ];  
}
