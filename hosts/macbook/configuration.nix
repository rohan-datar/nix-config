{
  pkgs,
  config,
  inputs,
  ...
}: {
  imports = [
    ./system.nix
    ../../modules/shared
    inputs.home-manager.darwinModules.home-manager
  ];

  home-manager = {
    extraSpecialArgs = {inherit inputs;};
    users = {
      rohandatar = import ./home.nix;
    };
  };

  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages = [
    pkgs.mkalias
    pkgs.iina
    pkgs.pngpaste
  ];

  homebrew = {
    enable = true;
    brews = [
      "tpm"
      "rust"
      "node"
      "mas"
      "openjdk@21"
    ];

    casks = [
      "aerospace"
      "appcleaner"
      "beeper"
      "chromium"
      "discord"
      "docker"
      "firefox"
      "obsidian"
      "omnidisksweeper"
      "the-unarchiver"
      "thunderbird"
      "wezterm"
      "zen-browser"
    ];

    masApps = {
      "Amphetamine" = 937984704;
      "Bitwarden" = 1352778147;
      "CopyClip" = 595191960;
      "Hidden Bar" = 1452453066;
      "Keynote" = 409183694;
      "Numbers" = 409203825;
      "Pages" = 409201541;
      "Tailscale" = 1475387142;
      "Xcode" = 497799835;
    };
    onActivation.cleanup = "zap";
    onActivation.autoUpdate = true;
    onActivation.upgrade = true;
  };

  fonts.packages = [
    pkgs.maple-mono-NF
    (pkgs.nerdfonts.override {fonts = ["FiraCode"];})
  ];

  # Auto upgrade nix package and the daemon service.
  services.nix-daemon.enable = true;
  # nix.package = pkgs.nix;

  # Create /etc/zshrc that loads the nix-darwin environment.
  programs.zsh.enable = true; # default shell on catalina
  # programs.fish.enable = true;

  # Set Git commit hash for darwin-version.
  # system.configurationRevision = self.rev or self.dirtyRev or null;

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 5;

  # The platform the configuration will be used on.
  nixpkgs.hostPlatform = "aarch64-darwin";
}
