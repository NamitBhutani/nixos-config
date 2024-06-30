{ pkgs, config, lib, ... }:
# let 
# package = config.boot.kernelPackages.nvidiaPackages.stable;
# in
{  
  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = true;
    powerManagement.finegrained = false;
    open = false;
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.mkDriver {
version = "555.58";
sha256_64bit = "sha256-bXvcXkg2kQZuCNKRZM5QoTaTjF4l2TtrsKUvyicj5ew=";
sha256_aarch64 = "sha256-7XswQwW1iFP4ji5mbRQ6PVEhD4SGWpjUJe1o8zoXYRE=";
openSha256 = "sha256-hEAmFISMuXm8tbsrB+WiUcEFuSGRNZ37aKWvf0WJ2/c=";
settingsSha256 = "sha256-vWnrXlBCb3K5uVkDFmJDVq51wrCoqgPF03lSjZOuU8M=";
persistencedSha256 = lib.fakeHash;
};
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
