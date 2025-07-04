{...}: {
  home.file = {
    ".config/networkmanager-dmenu/config.ini".text = ''
      [dmenu]
      dmenu_command = wofi --dmenu
      active_chars = 󰱓
      highlight = True
      highlight_fg = #94e2d5
      highlight_bg = #181825
      highlight_bold = True
      compact = True
      # pinentry = <Pinentry command>  # (Default: None) e.g. `pinentry-gtk`
      wifi_chars = ▂▄▆█
      wifi_icons = 󰤯󰤟󰤢󰤥󰤨
      # format = <Python style format string for the access point entries>
      format = {name}  {sec}  {icon}
      # # Available variables are:
      # #  * {name} - Access point name
      # #  * {sec} - Security type
      # #  * {signal} - Signal strength on a scale of 0-100
      # #  * {bars} - Bar-based display of signal strength (see wifi_chars)
      # #  * {icon} - Icon-based display of signal strength (see wifi_icons)
      # #  * {max_len_name} and {max_len_sec} are the maximum lengths of {name} / {sec}
      # #    respectively and may be useful for formatting.
      list_saved = True

      [dmenu_passphrase]
      # # Uses the -password flag for Rofi, -x for bemenu. For dmenu, sets -nb and
      # # -nf to the same color or uses -P if the dmenu password patch is applied
      # # https://tools.suckless.org/dmenu/patches/password/
      # obscure = True
      # obscure_color = #222222

      [pinentry]
      # description = <Pinentry description> (Default: Get network password)
      # prompt = <Pinentry prompt> (Default: Password:)

      [editor]
      terminal = ghostty
      # gui_if_available = <True or False> (Default: True)
      # gui = <name of gui editor> (Default: nm-connection-editor)

      [nmdm]
      # rescan_delay = <seconds>  # (seconds to wait after a wifi rescan before redisplaying the results)
    '';
  };
}
