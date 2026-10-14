{
  config,
  pkgs,
  inputs,
  username,
  host,
  ...
}:
{
  imports = [
    inputs.home-manager.nixosModules.home-manager
  ];

  home-manager = {
    backupFileExtension = "backup";
    useUserPackages = true;
    useGlobalPkgs = true;
    extraSpecialArgs = { inherit inputs username host; };
    users.${username} = {
      imports = [
        ./../home
        inputs.catppuccin.homeModules.catppuccin
      ];
      home.username = "${username}";
      home.homeDirectory = "/home/${username}";
      home.stateVersion = "23.11";
      programs.home-manager.enable = true;
    };
  };

  systemd.services."home-manager-${username}".serviceConfig.ExecCondition =
    let
      hm = config.home-manager.users.${username}.home;
    in
    pkgs.writeShellScript "hm-skip-unchanged-at-boot" ''
      case "$(${config.systemd.package}/bin/systemctl is-system-running)" in
        initializing | starting) ;;
        *) exit 0 ;;
      esac
      [ "$(readlink ${hm.homeDirectory}/.local/state/home-manager/gcroots/current-home)" != "${hm.activationPackage}" ]
    '';

  users.users.${username} = {
    isNormalUser = true;
    description = "${username}";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
    shell = pkgs.fish;
  };

  nix.settings.allowed-users = [ "${username}" ];
}
