{ pkgs, lib, ... }:
{
  services = {
    gvfs.enable = true;
    # gnome.gnome-keyring.enable = true;
    dbus.enable = true;
    fstrim.enable = true;
  };

  # services.logind.settings.Login = {
  #   HandlePowerKey = "ignore";
  # };

  services.sunshine = {
    enable = true;
    autoStart = false;
    # Enable nvenc support
    # package =
    #   with pkgs;
    #   (pkgs.sunshine.override {
    #     cudaSupport = true;
    #     cudaPackages = cudaPackages;
    #   }).overrideAttrs
    #     (old: {
    #       nativeBuildInputs = old.nativeBuildInputs ++ [
    #         cudaPackages.cuda_nvcc
    #         (lib.getDev cudaPackages.cuda_cudart)
    #       ];
    #       cmakeFlags = old.cmakeFlags ++ [
    #         "-DCMAKE_CUDA_COMPILER=${(lib.getExe cudaPackages.cuda_nvcc)}"
    #       ];
    #     });
    openFirewall = true;
    capSysAdmin = true;
  };

  services = {
    cloudflare-warp.enable = true;
  };

  # Disable the default warp-taskbar service
  systemd.user.services.warp-taskbar.enable = false;

  # Create a new complete service from scratch
  systemd.user.services.warp-taskbar-fixed = {
    description = "Cloudflare Zero Trust Client Taskbar";

    requires = [ "dbus.socket" ];
    after = [
      "dbus.socket"
      "graphical-session.target"
    ];
    partOf = [ "graphical-session.target" ];

    serviceConfig = {
      Type = "simple";
      ExecStart = "${pkgs.cloudflare-warp}/bin/warp-taskbar";
      Restart = "always";
      LimitSTACK = "33554432";
      BindReadOnlyPaths = "${pkgs.cloudflare-warp}:/usr";
    };

    wantedBy = [ "graphical-session.target" ];
  };

  # systemd = {
  #   user.services.polkit-gnome-authentication-agent-1 = {
  #     description = "polkit-gnome-authentication-agent-1";
  #     wantedBy = [ "graphical-session.target" ];
  #     wants = [ "graphical-session.target" ];
  #     after = [ "graphical-session.target" ];
  #     serviceConfig = {
  #         Type = "simple";
  #         ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
  #         Restart = "on-failure";
  #         RestartSec = 1;
  #         TimeoutStopSec = 10;
  #       };
  #   };
  # };

}
