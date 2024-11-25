{ pkgs, config, lib, ... }:

{  
  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = false;
    powerManagement.finegrained = false;
    open = false;
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.production;
    prime = {
  		offload = {
  			enable = true;
  			enableOffloadCmd = true;
  		};
  		nvidiaBusId = "PCI:1:0:0";
  		intelBusId = "PCI:0:2:0";
  	};
  };

  #    specialisation = {
  #   disableNvidia = {
  #     configuration = {
  #       boot.extraModprobeConfig = ''
  #         blacklist nouveau
  #         options nouveau modeset=0
  #       '';

  #       services.udev.extraRules = ''
  #         # Remove NVIDIA USB xHCI Host Controller devices, if present
  #         ACTION=="add", SUBSYSTEM=="pci", ATTR{vendor}=="0x10de", ATTR{class}=="0x0c0330", ATTR{power/control}="auto", ATTR{remove}="1"
  #         # Remove NVIDIA USB Type-C UCSI devices, if present
  #         ACTION=="add", SUBSYSTEM=="pci", ATTR{vendor}=="0x10de", ATTR{class}=="0x0c8000", ATTR{power/control}="auto", ATTR{remove}="1"
  #         # Remove NVIDIA Audio devices, if present
  #         ACTION=="add", SUBSYSTEM=="pci", ATTR{vendor}=="0x10de", ATTR{class}=="0x040300", ATTR{power/control}="auto", ATTR{remove}="1"
  #         # Remove NVIDIA VGA/3D controller devices
  #         ACTION=="add", SUBSYSTEM=="pci", ATTR{vendor}=="0x10de", ATTR{class}=="0x03[0-9]*", ATTR{power/control}="auto", ATTR{remove}="1"
  #       '';

  #       boot.blacklistedKernelModules = [ "nouveau" "nvidia" "nvidia_drm" "nvidia_modeset" ];
  #     };
  #   };
  # };
}
