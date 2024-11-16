{
  config,
  pkgs,
  ...
}: {
  imports = [
    ../../modules/home-manager
  ];
  home.file = {
    ".config/aerospace/aerospace.toml" = {
      source = ../../external-config/aerospace/aerospace.toml;
    };

    ".config/sketchybar" = {
      source = ../../external-config/sketchybar;
      recursive = true;
    };
  };
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "rohandatar";
  home.homeDirectory = "/Users/rohandatar";
}
