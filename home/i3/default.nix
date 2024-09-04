{ pkgs, lib, ... }: 
let
  # Define your variables here
  modKey = "Mod4";  # Modifier key

  workspace1 = "1";
  workspace2 = "2";
  workspace3 = "3";
  workspace4 = "4";
  workspace5 = "5";
  workspace6 = "6";
  workspace7 = "7";
  workspace8 = "8";
  workspace9 = "9";
  workspace10 = "10";

  mainDisplay = "DP-6";
  secondaryDisplay = "eDP-1";

  terminal = "kitty";
in
{
  xsession.windowManager.i3 = {
    enable = true;
    package = pkgs.i3;

    config = {
      modifier = modKey;  # Use the modifier variable

      # Assign workspaces to specific outputs
        workspaceOutputAssign = [
        { workspace = workspace1; output = mainDisplay; }
        { workspace = workspace2; output = mainDisplay; }
        { workspace = workspace3; output = mainDisplay; }
        { workspace = workspace4; output = mainDisplay; }
        { workspace = workspace5; output = mainDisplay; }
        { workspace = workspace6; output = mainDisplay; }
        { workspace = workspace7; output = mainDisplay; }
        { workspace = workspace8; output = mainDisplay; }
        { workspace = workspace9; output = secondaryDisplay; }
        { workspace = workspace10; output = mainDisplay; }
      ];

      # Keybindings
      keybindings = lib.mkOptionDefault {
        "${modKey}+Return" = "exec ${terminal}";
        "${modKey}+Shift+q" = "kill";
        "${modKey}+d" = "exec ${pkgs.dmenu}/bin/dmenu_run";

        "${modKey}+h" = "focus left";
        "${modKey}+j" = "focus down";
        "${modKey}+k" = "focus up";
        "${modKey}+l" = "focus right";
        "${modKey}+Shift+h" = "move left";
        "${modKey}+Shift+j" = "move down";
        "${modKey}+Shift+k" = "move up";
        "${modKey}+Shift+l" = "move right";

        # Split orientation
        "${modKey}+s+h" = "split h";
        "${modKey}+s+v" = "split v";

        # Fullscreen
        "${modKey}+f" = "fullscreen";

        # Change container layout
        "${modKey}+s" = "layout stacking";
        "${modKey}+w" = "layout tabbed";
        "${modKey}+e" = "layout toggle split";

        # Toggle tiling / floating
        "${modKey}+Shift+space" = "floating toggle";

        # Focus parent container
        "${modKey}+a" = "focus parent";

        "XF86MonBrightnessDown" = "exec brightnessctl set 5%-";
        "XF86MonBrightnessUp" = "exec brightnessctl set 5%+";
        
        "XF86AudioRaiseVolume" = "exec pactl set-sink-volume @DEFAULT_SINK@ set +5%";
        "XF86AudioLowerVolume" = "exec pactl set-sink-volume @DEFAULT_SINK@ set -5%";

      };

      assigns = {
        "${workspace7}" = [{ class = "^discord$"; }];
        "${workspace8}" = [{ class = "^Spotify$"; }];
      };

      bars = [
        {
          position = "top";
          # extraConfig = ''
          #   separator_block_width=15
          #
          #   [volume]
          #   # label=VOL
          #   label=♪
          #   instance=Master
          #   interval=1
          #   signal=10
          #
          #   [memory]
          #   label=MEM
          #   interval=30
          #
          #   [wifi]
          #   #instance=wlp3s0
          #   interval=10
          #   separator=false
          #
          #   [battery]
          #   # label=BAT
          #   label=⚡
          #   instance=1
          #   interval=30
          #
          #   [time]
          #   command=date '+%Y-%m-%d %H:%M:%S'
          #   interval=1
          # '';
        }
      ];
    };
  };

}

