{
  config,
  pkgs,
  inputs,
  ...
}: let
  pwaBrowser = pkgs.lib.getExe pkgs.google-chrome;
in {
  imports = [
    ../../common
    ./hypr
  ];

  home.packages = with pkgs; [
    blueman
    hyprshot
    hyprlock
    hypridle
    pavucontrol
    brightnessctl
    networkmanager_dmenu
    networkmanagerapplet
    ghostty
    fuzzel

    #fonts

    maple-mono.NF
    nerd-fonts.meslo-lg
    font-awesome
    inputs.apple-fonts.packages.${pkgs.system}.sf-pro
    inputs.apple-fonts.packages.${pkgs.system}.sf-pro-nerd
    inputs.apple-fonts.packages.${pkgs.system}.sf-compact
    inputs.apple-fonts.packages.${pkgs.system}.sf-compact-nerd
    inputs.apple-fonts.packages.${pkgs.system}.ny
    inputs.apple-fonts.packages.${pkgs.system}.ny-nerd
  ];
  fonts.fontconfig.enable = true;

  stylix.targets.font-packages.enable = true;
  stylix.targets.fontconfig.enable = true;
  stylix.iconTheme = {
    enable = true;
    package = pkgs.adwaita-icon-theme;
    light = "Adwaita";
    dark = "Adwaita";
  };

  # set up PWAs
  xdg.desktopEntries.appleMusic = {
    name = "Apple Music";
    exec = "${pwaBrowser} --app=https://music.apple.com/in/";
    icon = ./assets/icons8-apple-music-480.png;
  };

  programs.nh.flake = "/home/rdatar/nix";

  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "rdatar";
  home.homeDirectory = "/home/rdatar";
}
