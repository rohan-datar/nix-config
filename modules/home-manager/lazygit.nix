{...}: {
  programs.lazygit = {
    enable = true;
    settings = {
      gui.theme = {
        activeBorderColor = ["#89dceb" "bold"];
        inactiveBorderColor = ["#a6adc8"];
        optionsTextColor = ["#89b4fa"];
        selectedLineBgColor = ["#313244"];
        cherryPickedCommitBgColor = ["#45475a"];
        cherryPickedCommitFgColor = ["#89dceb"];
        unstagedChangesColor = ["#f38ba8"];
        defaultFgColor = ["#cdd6f4"];
        searchingActiveBorderColor = ["#f9e2af"];
        authorColors = ''
          * = [ "#b4befe" ];
        '';
      };
    };
  };
}
