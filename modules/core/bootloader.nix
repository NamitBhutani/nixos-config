{ pkgs, ... }:
{
  boot = {
    initrd = {
      systemd.enable = true;
      systemd.tpm2.enable = false;
      compressor = "zstd";
    };

    loader = {
      grub = {
        enable = true;
        devices = [ "nodev" ];
        efiSupport = true;
        useOSProber = false;
        extraEntries = ''
          menuentry "Windows" {
            insmod part_gpt
            insmod fat
            insmod chain
            search --no-floppy --fs-uuid --set=root A096-3ECD
            chainloader /EFI/Microsoft/Boot/bootmgfw.efi
          }
        '';
        timeoutStyle = "hidden";
        splashImage = null;
        configurationLimit = 10;
      };

      efi = {
        canTouchEfiVariables = true;
      };

      timeout = 0;
    };

    kernelPackages = pkgs.linuxPackages_latest;
    kernel.sysctl = {
      "kernel.perf_event_mlock_kb" = 131072;
    };
    kernelParams = [
      # "amdgpu.backlight=0"
      "quiet"
      "workqueue.power_efficient=y"
    ];
  };

  services.lvm.enable = false;
  systemd.tpm2.enable = false;
}
