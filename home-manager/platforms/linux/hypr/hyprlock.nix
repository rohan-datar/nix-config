{...}: {
  programs.hyprlock = {
    enable = true;

    settings = {
      # GENERAL
      general = {
        disable_loading_bar = true;
        hide_cursor = true;
      };

      # BACKGROUND
      background = {
        path = "~/.local/share/backgrounds/Cloudsnight.jpg";
        blur_passes = 2;
        color = "$base";
      };

      label = [
        # TIME
        {
          text = ''cmd[update:30000] echo "$(date +"%R")"'';
          color = "$text";
          font_size = 90;
          font_family = "$font";
          position = "-30, 0";
          halign = "right";
          valign = "top";
        }

        # DATE
        {
          text = ''cmd[update:43200000] echo "$(date +"%A, %d %B %Y")"'';
          color = "$text";
          font_size = 25;
          font_family = "$font";
          position = "-30, -150";
          halign = "right";
          valign = "top";
        }
      ];

      # USER AVATAR

      # image = {
      #     path = "~/.face";
      #     size = 100;
      #     border_color = "$accent";
      #     position = "0, 75";
      #     halign = "center";
      #     valign = "center";
      # };

      # INPUT FIELD
      input-field = {
        size = "300, 60";
        outline_thickness = "4";
        dots_size = "0.2";
        dots_spacing = "0.2";
        dots_center = "true";
        outer_color = "$accent";
        inner_color = "$surface0";
        font_color = "$text";
        fade_on_empty = "false";
        placeholder_text = ''<span foreground="##$textAlpha"><i>󰌾 Logged in as </i><span foreground="##$accentAlpha">$USER</span></span>'';
        # placeholder_text = "󰌾 Logged in as $USER";
        hide_input = "false";
        check_color = "$accent";
        fail_color = "$red";
        fail_text = "<i>$FAIL <b>($ATTEMPTS)</b></i>";
        capslock_color = "$yellow";
        position = "0, -35";
        halign = "center";
        valign = "center";
      };
    };
  };
}
