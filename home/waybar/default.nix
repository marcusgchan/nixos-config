{ ... }: {
  programs.waybar.enable = true;
  home.file.".config/waybar/config".source = ./config;
  home.file.".config/waybar/style.css".source = ./style.css;
  home.file.".config/waybar/launch.sh".source = ./launch.sh;
}
