{ config, ... }: {
  programs.zsh = {
    enable = true;
	  enableCompletion = true;
    autosuggestion.enable = true;

	  shellAliases = {
	    ll = "ls -l";
	    update = "sudo nixos-rebuild switch";
	  };
	  history.size = 10000;
	  history.path = "${config.xdg.dataHome}/zsh/history";
    oh-my-zsh = {
      enable = true;
      plugins = [ "git" ];
      theme = "agnoster";
    };
    initExtra = ''
      # eval "$(fzf --zsh)"
    '';
  };
}
