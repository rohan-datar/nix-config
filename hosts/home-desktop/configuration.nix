# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
{
  config,
  pkgs,
  inputs,
  ...
}: {
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
    ./system.nix
    ../../modules/shared
    # ./overlays.nix
  ];

  catppuccin = {
    enable = true;
    flavor = "mocha";
  };

  # Install firefox.
  programs.firefox.enable = true;

  # Set zsh as the default shell
  programs.zsh.enable = true;
  users.defaultUserShell = pkgs.zsh;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    kitty
    busybox
    cider
    bitwarden-desktop
    cargo
    clang
    gcc
    nodejs
    lua
    gnumake
    gnome-tweaks
    gnome-terminal
    cacert
    wl-clipboard
    ungoogled-chromium
    obsidian
    inputs.zen-browser.packages."${system}".default
    inputs.ghostty.packages.x86_64-linux.default
    libnotify
    glib
    copyq
    swift
    thunderbird
    cifs-utils
  ];

  environment.sessionVariables = {
    TERMINAL = "ghostty";
    DEFAULT_BROWSER = "zen";
    NIXOS_OZONE_WL = "1";
  };

  environment.variables.EDITOR = "nvim";

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?
}
