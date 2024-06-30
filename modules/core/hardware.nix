{ pkgs, config, ... }:
{  
  hardware.graphics.enable = true;
  #hardware.opengl.driSupport = true;
  hardware.graphics.enable32Bit = true;
  hardware.enableRedistributableFirmware = true;
}
