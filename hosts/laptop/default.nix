{ pkgs, config, ... }:
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
    # geoclue-based: timezone follows location automatically (overrides time.timeZone to null)
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
        # CPU: intel_pstate active + HWP on both sides; TLP ignores keys with
        # only one power-source side set, so every pair is explicit
        CPU_DRIVER_OPMODE_ON_AC = "active";
        CPU_DRIVER_OPMODE_ON_BAT = "active";
        CPU_SCALING_GOVERNOR_ON_AC = "powersave"; # HWP does the scaling in active mode
        CPU_SCALING_GOVERNOR_ON_BAT = "powersave";
        CPU_ENERGY_PERF_POLICY_ON_AC = "performance";
        CPU_ENERGY_PERF_POLICY_ON_BAT = "power";
        CPU_BOOST_ON_AC = 1;
        CPU_BOOST_ON_BAT = 0; # no turbo on battery = capped at 2.3 GHz base clock
        CPU_HWP_DYN_BOOST_ON_AC = 1;
        CPU_HWP_DYN_BOOST_ON_BAT = 0;

        # iGPU: cap render clocks on battery (hardware range 350-1450 MHz)
        INTEL_GPU_MIN_FREQ_ON_AC = 350;
        INTEL_GPU_MIN_FREQ_ON_BAT = 350;
        INTEL_GPU_MAX_FREQ_ON_AC = 1450;
        INTEL_GPU_MAX_FREQ_ON_BAT = 1000;
        INTEL_GPU_BOOST_FREQ_ON_AC = 1450;
        INTEL_GPU_BOOST_FREQ_ON_BAT = 1100;

        # PCIe / runtime PM: nvidia is NOT in TLP's driver denylist, so the
        # TLP default RUNTIME_PM_ON_AC=on would pin the dGPU awake on AC
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

  boot = {
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
