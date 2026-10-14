{
  pkgs,
  lib,
  username,
  ...
}:
let
  warp-toggle = pkgs.writeShellScriptBin "warp-toggle" ''
    if systemctl is-active -q cloudflare-warp; then
      warp-cli --accept-tos disconnect >/dev/null 2>&1
      systemctl --user stop warp-taskbar-fixed
      systemctl stop cloudflare-warp
      ${pkgs.libnotify}/bin/notify-send -a WARP "WARP off"
    else
      systemctl start cloudflare-warp
      for _ in $(seq 40); do
        warp-cli --accept-tos status >/dev/null 2>&1 && break
        sleep 0.25
      done
      warp-cli --accept-tos connect >/dev/null
      systemctl --user start warp-taskbar-fixed
      ${pkgs.libnotify}/bin/notify-send -a WARP "WARP on"
    fi
  '';
in
{
  services = {
    gvfs.enable = true;
    gnome.gnome-keyring.enable = true;
    dbus.enable = true;
    fstrim.enable = true;
  };

  security.pam.services.greetd.enableGnomeKeyring = true;

  services.journald.settings.Journal = {
    SystemMaxUse = "200M";
  };

  # services.logind.settings.Login = {
  #   HandlePowerKey = "ignore";
  # };

  # services.sunshine = {
  #   enable = true;
  #   autoStart = false;
  #   # Enable nvenc support
  #   # package =
  #   #   with pkgs;
  #   #   (pkgs.sunshine.override {
  #   #     cudaSupport = true;
  #   #     cudaPackages = cudaPackages;
  #   #   }).overrideAttrs
  #   #     (old: {
  #   #       nativeBuildInputs = old.nativeBuildInputs ++ [
  #   #         cudaPackages.cuda_nvcc
  #   #         (lib.getDev cudaPackages.cuda_cudart)
  #   #       ];
  #   #       cmakeFlags = old.cmakeFlags ++ [
  #   #         "-DCMAKE_CUDA_COMPILER=${(lib.getExe cudaPackages.cuda_nvcc)}"
  #   #       ];
  #   #     });
  #   openFirewall = true;
  #   capSysAdmin = true;
  # };

  services = {
    cloudflare-warp.enable = true;
  };
  systemd.services.cloudflare-warp.wantedBy = lib.mkForce [ ];
  environment.systemPackages = [ warp-toggle ];

  security.polkit.extraConfig = ''
    polkit.addRule(function(action, subject) {
      if (action.id == "org.freedesktop.systemd1.manage-units" &&
          action.lookup("unit") == "cloudflare-warp.service" &&
          subject.user == "${username}") {
        var verb = action.lookup("verb");
        if (verb == "start" || verb == "stop" || verb == "restart")
          return polkit.Result.YES;
      }
    });
  '';

  systemd.user.services.warp-taskbar.enable = false;

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
  };

  systemd.services.sesinetd = {
    description = "Houdini License Server";
    after = [ "network.target" ];
    serviceConfig = {
      Type = "forking";
      ExecStart = "${pkgs.houdini}/houdini/sbin/sesinetd";
      Restart = "on-failure";
      User = "root";
    };
  };
  systemd.timers.sesinetd = {
    wantedBy = [ "timers.target" ];
    timerConfig.OnBootSec = "90s";
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
