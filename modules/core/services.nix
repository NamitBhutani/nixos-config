{ pkgs, ... }:
{
  services = {
    gvfs.enable = true;
    # gnome.gnome-keyring.enable = true;
    dbus.enable = true;
    fstrim.enable = true;
  };
  services.logind.extraConfig = ''
    # don’t shutdown when power button is short-pressed
    HandlePowerKey=ignore
  '';

  services.sunshine = {
    enable = true;
    autoStart = false;
    # Enable nvenc support
    package =
      with pkgs;
      (pkgs.sunshine.override {
        cudaSupport = true;
        cudaPackages = cudaPackages;
      }).overrideAttrs
        (old: {
          nativeBuildInputs = old.nativeBuildInputs ++ [
            cudaPackages.cuda_nvcc
            (lib.getDev cudaPackages.cuda_cudart)
          ];
          cmakeFlags = old.cmakeFlags ++ [
            "-DCMAKE_CUDA_COMPILER=${(lib.getExe cudaPackages.cuda_nvcc)}"
          ];
        });
    openFirewall = true;
    capSysAdmin = true;
  };

  services = {
    greetd = {
      enable = true;
      settings = rec {
        initial_session = {
          command = "uwsm start hyprland-uwsm.desktop";
          user = "intellomaniac";
        };
        default_session = initial_session;
      };
    };
    cloudflare-warp.enable = true;
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
