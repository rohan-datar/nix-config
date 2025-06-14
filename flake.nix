{
  description = "Nix config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-darwin = {
      url = "github:LnL7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    agenix = {
      url = "github:ryantm/agenix";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        home-manager.follows = "home-manager";
        darwin.follows = "nix-darwin";
      };
    };

    nix-homebrew.url = "github:zhaofengli-wip/nix-homebrew";

    # Zen browser
    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        home-manager.follows = "home-manager";
      };
    };

    # NixOS view configuration
    stylix = {
      url = "github:danth/stylix";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        tinted-schemes.follows = "tinted-schemes";
        home-manager.follows = "home-manager";
      };
    };

    apple-fonts.url = "github:Lyndeno/apple-fonts.nix";

    tinted-schemes = {
      flake = false;
      url = "github:tinted-theming/schemes";
    };

    hyprpanel = {
      url = "github:jas-singhfsu/hyprpanel";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    nix-darwin,
    nix-homebrew,
    home-manager,
    stylix,
    agenix,
    ...
  } @ inputs: let
    home-desktop = "home-desktop";
    macbook = "macbook";
  in {
    # config for desktop
    nixosConfigurations.${home-desktop} = nixpkgs.lib.nixosSystem {
      specialArgs = {inherit inputs;};
      modules = [
        ./hosts/${home-desktop}/configuration.nix
        # catppuccin.nixosModules.catppuccin
        stylix.nixosModules.stylix
        agenix.nixosModules.default
      ];
    };

    # config for macbook
    darwinConfigurations.${macbook} = nix-darwin.lib.darwinSystem {
      specialArgs = {inherit inputs;};
      modules = [
        ./hosts/${macbook}/configuration.nix
        nix-homebrew.darwinModules.nix-homebrew
        {
          nix-homebrew = {
            enable = true;
            # Apple Silicon Only
            enableRosetta = true;

            user = "rohandatar";

            autoMigrate = true;
          };
        }
        agenix.darwinModules.default
        stylix.darwinModules.stylix
      ];
    };

    homeConfigurations = {
      rdatar = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages."x86_64-linux";
        extraSpecialArgs = {inherit inputs;};
        modules = [
          ./home-manager/platforms/linux/home.nix
          stylix.homeModules.stylix
          {nixpkgs.overlays = [inputs.hyprpanel.overlay];}
        ];
      };

      rohandatar = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages."aarch64-darwin";
        extraSpecialArgs = {inherit inputs;};
        modules = [
          ./home-manager/platforms/macos/home.nix
          stylix.homeModules.stylix
        ];
      };
    };
  };
}
