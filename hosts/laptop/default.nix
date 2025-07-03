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
  ];
  nix.package = pkgs.lix;
  services.greetd = {
  enable = true;
  settings = rec {
    initial_session = {
      command = "uwsm start hyprland-uwsm.desktop";
      user = "intellomaniac";
    };
    default_session = initial_session;
  };
};

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
      enable=true;
      settings={
        CPU_ENERGY_PERF_POLICY_ON_BAT="power";
        PLATFORM_PROFILE_ON_BAT="low-power";
        RUNTIME_PM_ON_BAT="auto";
        NMI_WATCHDOG=0;
        MEM_SLEEP_ON_BAT="deep";
        CPU_DRIVER_OPMODE_ON_BAT="passive";
        DEVICES_TO_DISABLE_ON_STARTUP="bluetooth";
        CPU_BOOST_ON_BAT=0;
        CPU_HWP_DYN_BOOST_ON_BAT=0;
        WIFI_PWR_ON_BAT="on";
        USB_EXCLUDE_PHONE=1;

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
    kernelModules = ["acpi_call" "ec_sys"];
    extraModulePackages = with config.boot.kernelPackages;
      [
        acpi_call
      ];
  };
  
  specialisation = {
    battery-mode = {
      inheritParentConfig = true;
      configuration = {
        system.nixos.tags = [ "battery-mode" ];
        boot.blacklistedKernelModules = [ "nvidia_drm" ];
        
        home-manager.users.intellomaniac = {
          home.file = {
            ".config/uwsm/env".text = ''
              export __EGL_VENDOR_LIBRARY_FILENAMES=/run/opengl-driver/share/glvnd/egl_vendor.d/50_mesa.json
            '';
            
            ".config/uwsm/env-hyprland".text = ''
              export AQ_DRM_DEVICES=/dev/dri/card1
            '';
          };
        };
      };
    };
  };

 
}
