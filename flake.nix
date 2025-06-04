{
  description = "intellomaniac's nixos configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nur.url = "github:nix-community/NUR";
    catppuccin.url = "github:catppuccin/nix";
    hypr-contrib.url = "github:hyprwm/contrib";
    hyprpicker.url = "github:hyprwm/hyprpicker";
    wezterm.url = "github:wez/wezterm?dir=nix";
     zen-browser = {
    url = "github:0xc000022070/zen-browser-flake";  
    inputs.nixpkgs.follows = "nixpkgs";
  };
    hyprland = {
      type = "git";
      url = "https://github.com/hyprwm/Hyprland";
      submodules = true;
    };
    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };

  outputs = { nixpkgs, self, catppuccin, home-manager, spicetify-nix, ... } @ inputs:
  let
    username = "intellomaniac";
    system = "x86_64-linux";
    pkgs = import nixpkgs {
      inherit system;
      config.allowUnfree = true;
    };
    lib = nixpkgs.lib;
  in
  {
    nixosConfigurations = { 
      laptop = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [
          (import ./hosts/laptop)
          
        ];
        specialArgs = { host = "laptop"; inherit self inputs username; };
      };
    };
  };
}
