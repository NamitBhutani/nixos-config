{ config, pkgs, ... }:

{
  # nixpkgs.config.packageOverrides = pkgs: {
  #   intel-vaapi-driver = pkgs.intel-vaapi-driver.override { enableHybridCodec = true; };
  # };

  hardware.graphics.enable = true;
  #  hardware.opengl.driSupport = true;
  hardware.graphics.enable32Bit = true;
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
    settings = {
      General = {
        Experimental = true; # Show battery charge of Bluetooth devices
      };
    };
  };
  hardware.graphics.extraPackages = with pkgs; [
    #intel-media-driver # LIBVA_DRIVER_NAME=iHD
    #  intel-vaapi-driver # LIBVA_DRIVER_NAME=i965 (older but works better for Firefox/Chromium)
    libvdpau-va-gl
  ];
  hardware.enableRedistributableFirmware = true;
}
