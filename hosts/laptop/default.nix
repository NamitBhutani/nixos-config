{
  pkgs,
  config,
  lib,
  ...
}:
{
  imports = [
    ./hardware-configuration.nix
    ./../../modules/core
    # ./../../cachix.nix
  ];

  environment.systemPackages = with pkgs; [
    acpi
    brightnessctl
    hyprpolkitagent
    jq
    jc
    mcontrolcenter
    clash-meta
    bzmenu
    nixfmt
  ];

  nix.package = pkgs.lix;

  environment.sessionVariables = {
    QT_QPA_PLATFORMTHEME = "kvantum";
    QT_STYLE_OVERRIDE = "kvantum";
    LIBVA_DRIVER_NAME = "iHD";
    #AMD_VULKAN_ICD = "RADV";
  };

  services = {
    blueman.enable = true;
    thermald.enable = true;
    automatic-timezoned.enable = true;
    #  getty.autologinUser = "intellomaniac";
    # cpupower-gui.enable = true;
    #power-profiles-daemon.enable = true;

    upower = {
      enable = true;
      percentageLow = 20;
      percentageCritical = 5;
      percentageAction = 3;
      criticalPowerAction = "PowerOff";
    };

    tlp = {
      enable = true;
      settings = {
        CPU_DRIVER_OPMODE_ON_AC = "active";
        CPU_DRIVER_OPMODE_ON_BAT = "active";
        CPU_SCALING_GOVERNOR_ON_AC = "powersave";
        CPU_SCALING_GOVERNOR_ON_BAT = "powersave";
        CPU_ENERGY_PERF_POLICY_ON_AC = "performance";
        CPU_ENERGY_PERF_POLICY_ON_BAT = "power";
        CPU_BOOST_ON_AC = 1;
        CPU_BOOST_ON_BAT = 0;
        CPU_HWP_DYN_BOOST_ON_AC = 1;
        CPU_HWP_DYN_BOOST_ON_BAT = 0;

        INTEL_GPU_MIN_FREQ_ON_AC = 350;
        INTEL_GPU_MIN_FREQ_ON_BAT = 350;
        INTEL_GPU_MAX_FREQ_ON_AC = 1450;
        INTEL_GPU_MAX_FREQ_ON_BAT = 1000;
        INTEL_GPU_BOOST_FREQ_ON_AC = 1450;
        INTEL_GPU_BOOST_FREQ_ON_BAT = 1100;

        PCIE_ASPM_ON_AC = "default";
        PCIE_ASPM_ON_BAT = "powersupersave";
        RUNTIME_PM_ON_AC = "auto";
        RUNTIME_PM_ON_BAT = "auto";

        NMI_WATCHDOG = 0;
        MEM_SLEEP_ON_AC = "deep";
        MEM_SLEEP_ON_BAT = "deep";
        WIFI_PWR_ON_AC = "off";
        WIFI_PWR_ON_BAT = "on";
        USB_EXCLUDE_PHONE = 1;
        DEVICES_TO_DISABLE_ON_STARTUP = "bluetooth";
      };
    };

    # auto-cpufreq = {
    #   enable = true;
    #   settings = {
    #     battery = {
    #       energy_performance_preference = "power";
    #       governor = "powersave";
    #       turbo = "never";
    #     };
    #     charger = {
    #       governor = "performance";
    #       turbo = "auto";
    #     };
    #   };
    # };
  };

  systemd.services.tlp-boot-ac = {
    description = "TLP AC profile while booting";
    wantedBy = [ "multi-user.target" ];
    unitConfig.DefaultDependencies = false;
    after = [ "local-fs.target" ];
    serviceConfig.Type = "oneshot";
    script = "${config.services.tlp.package}/bin/tlp ac";
  };
  systemd.services.tlp.wantedBy = lib.mkForce [ ];
  systemd.timers.tlp = {
    wantedBy = [ "timers.target" ];
    timerConfig.OnBootSec = "60s";
  };

  systemd.services.greetd.serviceConfig.ExecStartPre = [
    "-${config.systemd.package}/bin/udevadm wait --timeout=15 /dev/dri/by-path/pci-0000:00:02.0-card /dev/dri/by-path/pci-0000:01:00.0-card"
  ];

  hardware.firmware = [
    (pkgs.runCommandLocal "edid-lq173m1jw05-151hz" { } ''
      install -Dm444 ${./edid/lq173m1jw05-151hz.bin} $out/lib/firmware/edid/lq173m1jw05-151hz.bin
    '')
  ];

  boot = {
    kernelParams = [ "drm.edid_firmware=eDP-1:edid/lq173m1jw05-151hz.bin" ];
    kernelModules = [
      "acpi_call"
      "msi-ec"
      "ec_sys"
    ];
    extraModulePackages = with config.boot.kernelPackages; [
      acpi_call
      msi-ec
    ];
    extraModprobeConfig = ''
      options ec_sys write_support=1
    '';
  };
}
