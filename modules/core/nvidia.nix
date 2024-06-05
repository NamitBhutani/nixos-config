{ pkgs, config, lib, ... }:
{  
  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = true;
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

  #   specialisation = {
  #   nvidia-sync.configuration = {
  #     system.nixos.tags = [ "nvidia-sync" ];
  #     hardware.nvidia = {
  #       powerManagement.finegrained = lib.mkForce false;

  #       prime.offload.enable = lib.mkForce false;
  #       prime.offload.enableOffloadCmd = lib.mkForce false;

  #       prime.sync.enable = lib.mkForce true;
  #       # Dynamic Boost. It is a technology found in NVIDIA Max-Q design laptops with RTX GPUs.
  #       # It intelligently and automatically shifts power between
  #       # the CPU and GPU in real-time based on the workload of your game or application.
  #       dynamicBoost.enable = lib.mkForce true;
  #     };
  #   };
  # };
}
