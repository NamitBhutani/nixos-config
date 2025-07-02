{ config, pkgs, ... }:

{
  # nixpkgs.config.packageOverrides = pkgs: {
  #   intel-vaapi-driver = pkgs.intel-vaapi-driver.override { enableHybridCodec = true; };
  # };

  hardware.graphics.enable = true;
  # hardware.opengl.driSupport = true;
  hardware.graphics.enable32Bit = true;
  hardware.graphics.extraPackages = with pkgs; [
    intel-media-driver # LIBVA_DRIVER_NAME=iHD
    libvdpau-va-gl
  ];
  hardware.enableRedistributableFirmware = true;
}
