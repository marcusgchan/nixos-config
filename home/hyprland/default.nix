{ ... }: {
  home.file.".config/hypr/wallpapers" = {
    source = ./wallpapers;
    recursive = true;
  };
  home.file.".config/hypr/start.sh".source = ./start.sh;
  wayland.windowManager.hyprland = {
    enable = true;
    extraConfig = ''
      $MonitorInput = DP-6
      $LaptopInput = eDP-1
      monitor=DP-6, 2560x1440@165, auto, auto
      monitor=$LaptopInput, highrr, auto-left, auto
      monitor=$LaptopInput, highres, auto, auto

      workspace = 1, monitor:$MonitorInput, default:true
      workspace = 2, monitor:$MonitorInput 
      workspace = 3, monitor:$MonitorInput 
      workspace = 4, monitor:$MonitorInput 
      workspace = 5, monitor:$MonitorInput 
      workspace = 6, monitor:$MonitorInput 
      workspace = 7, monitor:$MonitorInput 
      workspace = 8, monitor:$MonitorInput 
      workspace = 9, monitor:$LaptopInput, default:true
      workspace = 10, monitor:$MonitorInput

      $terminal = kitty
      $fileManager = dolphin
      $menu = fuzzel

      windowrulev2 = opacity 0.0 override,class:^(xwaylandvideobridge)$
      windowrulev2 = noanim,class:^(xwaylandvideobridge)$
      windowrulev2 = noinitialfocus,class:^(xwaylandvideobridge)$
      windowrulev2 = maxsize 1 1,class:^(xwaylandvideobridge)$
      windowrulev2 = noblur,class:^(xwaylandvideobridge)$

      # Some default env vars.
      env = XCURSOR_SIZE,24
      env = QT_QPA_PLATFORMTHEME,qt5ct # change to qt6ct if you have that

      # For all categories, see https://wiki.hyprland.org/Configuring/Variables/
      input {
          kb_layout = us
          kb_variant =
          kb_model =
          kb_options =
          kb_rules =

          follow_mouse = 1

          touchpad {
              natural_scroll = yes
          }

          sensitivity = 0 # -1.0 to 1.0, 0 means no modification.
      }

      general {
          # See https://wiki.hyprland.org/Configuring/Variables/ for more

          gaps_in = 5
          gaps_out = 5
          border_size = 2
          col.active_border = rgba(33ccffee) rgba(00ff99ee) 45deg
          col.inactive_border = rgba(595959aa)

          layout = master

          # Please see https://wiki.hyprland.org/Configuring/Tearing/ before you turn this on
          allow_tearing = false
      }

      decoration {
          # See https://wiki.hyprland.org/Configuring/Variables/ for more

          rounding = 10
          
          blur {
              enabled = true
              size = 3
              passes = 1
          }

          drop_shadow = yes
          shadow_range = 4
          shadow_render_power = 3
          col.shadow = rgba(1a1a1aee)
      }

      animations {
          enabled = false

          # Some default animations, see https://wiki.hyprland.org/Configuring/Animations/ for more

          bezier = myBezier, 0.05, 0.9, 0.1, 1.05

          animation = windows, 1, 7, myBezier
          animation = windowsOut, 1, 7, default, popin 80%
          animation = border, 1, 10, default
          animation = borderangle, 1, 8, default
          animation = fade, 1, 7, default
          animation = workspaces, 1, 6, default
      }

      # dwindle {
      #     # See https://wiki.hyprland.org/Configuring/Dwindle-Layout/ for more
      #     pseudotile = yes # master switch for pseudotiling. Enabling is bound to mainMod + P in the keybinds section below
      #     preserve_split = yes # you probably want this
      # }

      master {
          # See https://wiki.hyprland.org/Configuring/Master-Layout/ for more
          # new_is_master = false
      }

      gestures {
          # See https://wiki.hyprland.org/Configuring/Variables/ for more
          workspace_swipe = off
      }

      misc {
          # See https://wiki.hyprland.org/Configuring/Variables/ for more
          force_default_wallpaper = 0 # Set to 0 or 1 to disable the anime mascot wallpapers
      }

      # Example per-device config
      # See https://wiki.hyprland.org/Configuring/Keywords/#per-device-input-configs for more
      device {
          name = epic-mouse-v1
          sensitivity = -0.5
      }

      # Example windowrule v1
      # windowrule = float, ^(kitty)$
      # Example windowrule v2
      # windowrulev2 = float,class:^(kitty)$,title:^(kitty)$
      # See https://wiki.hyprland.org/Configuring/Window-Rules/ for more
      windowrulev2 = suppressevent maximize, class:.* # You'll probably like this.
      windowrulev2 = workspace 7 silent, class:^(discord)$
      windowrulev2 = workspace 8 silent, initialTitle:^(Spotify)(.*)$

      windowrulev2 = opacity 0.97, title:.*

      # See https://wiki.hyprland.org/Configuring/Keywords/ for more
      $mainMod = SUPER

      # Example binds, see https://wiki.hyprland.org/Configuring/Binds/ for more
      bind = $mainMod, RETURN, exec, $terminal
      bind = $mainMod SHIFT, Q, killactive, 
      bind = $mainMod SHIFT, E, exit, 
      bind = $mainMod SHIFT, R, exec, ~/.config/waybar/launch.sh 
      bind = $mainMod, E, exec, $fileManager
      bind = $mainMod, V, togglefloating, 
      bind = $mainMod, D, exec, $menu
      bind = $mainMod, P, pseudo, # dwindle
      bind = $mainMod, J, togglesplit, # dwindle

      # Brightness control
      bind = ,XF86MonBrightnessDown,exec,brightnessctl set 5%-
      bind = ,XF86MonBrightnessUp,exec,brightnessctl set +5%

      # Sound control
      bind = , XF86AudioRaiseVolume, exec, pactl set-sink-volume @DEFAULT_SINK@ +5%
      bind = , XF86AudioLowerVolume, exec, pactl set-sink-volume @DEFAULT_SINK@ -5%

      # Move focus with mainMod + arrow keys
      bind = $mainMod, H, movefocus, l
      bind = $mainMod, L, movefocus, r
      bind = $mainMod, K, movefocus, u
      bind = $mainMod, J, movefocus, d

      bind = $mainMod SHIFT, H, swapwindow, l
      bind = $mainMod SHIFT, L, swapwindow, r
      bind = $mainMod SHIFT, K, swapwindow, u
      bind = $mainMod SHIFT, J, swapwindow, d

      # Switch workspaces with mainMod + [0-9]
      bind = $mainMod, 1, workspace, 1
      bind = $mainMod, 2, workspace, 2
      bind = $mainMod, 3, workspace, 3
      bind = $mainMod, 4, workspace, 4
      bind = $mainMod, 5, workspace, 5
      bind = $mainMod, 6, workspace, 6
      bind = $mainMod, 7, workspace, 7
      bind = $mainMod, 8, workspace, 8
      bind = $mainMod, 9, workspace, 9
      bind = $mainMod, 0, workspace, 10

      # Move active window to a workspace with mainMod + SHIFT + [0-9]
      bind = $mainMod SHIFT, 1, movetoworkspacesilent, 1
      bind = $mainMod SHIFT, 2, movetoworkspacesilent, 2
      bind = $mainMod SHIFT, 3, movetoworkspacesilent, 3
      bind = $mainMod SHIFT, 4, movetoworkspacesilent, 4
      bind = $mainMod SHIFT, 5, movetoworkspacesilent, 5
      bind = $mainMod SHIFT, 6, movetoworkspacesilent, 6
      bind = $mainMod SHIFT, 7, movetoworkspacesilent, 7
      bind = $mainMod SHIFT, 8, movetoworkspacesilent, 8
      bind = $mainMod SHIFT, 9, movetoworkspacesilent, 9
      bind = $mainMod SHIFT, 0, movetoworkspacesilent, 10

      # Screenshot
      bind = , Print, exec, grim -g "$(slurp -d)" - | wl-copy
      bind =  SHIFT, Print, exec, grim -g "$(slurp -d)"


      # Example special workspace (scratchpad)
      bind = $mainMod, S, togglespecialworkspace, magic
      bind = $mainMod SHIFT, S, movetoworkspace, special:magic

      # Scroll through existing workspaces with mainMod + scroll
      # bind = $mainMod, mouse_down, workspace, e+1
      # bind = $mainMod, mouse_up, workspace, e-1

      # Move/resize windows with mainMod + LMB/RMB and dragging
      bindm = $mainMod, mouse:272, movewindow
      bindm = $mainMod, mouse:273, resizewindowhypr

      exec-once=bash ~/.config/hypr/start.sh
      exec-once=hyprctl dispatch workspace 1
    '';
  };
}
