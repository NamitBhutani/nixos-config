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
    nixfmt-rfc-style
  ];

  nix.package = pkgs.lix;

  services = {
    thermald.enable = true;
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
        CPU_ENERGY_PERF_POLICY_ON_BAT = "power";
        PLATFORM_PROFILE_ON_BAT = "low-power";
        RUNTIME_PM_ON_BAT = "auto";
        NMI_WATCHDOG = 0;
        MEM_SLEEP_ON_BAT = "deep";
        CPU_DRIVER_OPMODE_ON_BAT = "passive";
        DEVICES_TO_DISABLE_ON_STARTUP = "bluetooth";
        CPU_BOOST_ON_BAT = 0;
        CPU_HWP_DYN_BOOST_ON_BAT = 0;
        WIFI_PWR_ON_BAT = "on";
        USB_EXCLUDE_PHONE = 1;

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
      msi-ec
      acpi_call
    ];
  };
}
