{ pkgs, config, ... }: 
{
  imports = [
    ./hardware-configuration.nix
    ./../../modules/core
  ];

  environment.systemPackages = with pkgs; [
    acpi
    brightnessctl
  ];

  environment.sessionVariables.NIXOS_OZONE_WL = "1";
  
  services = {    
     thermald.enable = true;
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
      enable=true;
      settings={
        CPU_ENERGY_PERF_POLICY_ON_BAT="power";
        PLATFORM_PROFILE_ON_BAT="low-power";
        CPU_BOOST_ON_BAT=0;
        CPU_HWP_DYN_BOOST_ON_BAT=0;
        NMI_WATCHDOG=0;
        MEM_SLEEP_ON_BAT="deep";
        CPU_DRIVER_OPMODE_ON_BAT="passive";
        DEVICES_TO_DISABLE_ON_STARTUP="bluetooth";
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
    kernelModules = ["acpi_call"];
    extraModulePackages = with config.boot.kernelPackages;
      [
        acpi_call
      ];
  };

 
}
