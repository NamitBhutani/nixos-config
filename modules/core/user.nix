{
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
