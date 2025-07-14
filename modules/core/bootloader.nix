{ pkgs, ... }:
{
  boot = {
    initrd = {
      systemd.enable = true;
      compressor = "zstd";
    };

    loader = {
      grub = {
        enable = true;
        devices = [ "nodev" ];
        efiSupport = true;
        useOSProber = true;
        timeoutStyle = "hidden";

      };

      efi = {
        canTouchEfiVariables = true;
      };

      timeout = 0;
      systemd-boot.configurationLimit = 10;
    };

    kernelPackages = pkgs.linuxPackages_latest;

    kernelParams = [
      "ec_sys.write_support=1"
      "quiet"
    ];
  };
}
