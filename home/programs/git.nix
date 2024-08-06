{ ... }: {
  programs.git = {
    enable = true;
    userName = "Marcus Chan";
    userEmail = "marcuscchan@gmail.com";
    extraConfig = {
      init.defaultBranch = "main";
    };
  };
}
