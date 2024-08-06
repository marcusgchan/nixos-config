{ pkgs, ... }:

let
  treesitterWithGrammars = (pkgs.vimPlugins.nvim-treesitter.withPlugins (p: [
    p.c
    p.bash
    p.comment
    p.css
    p.dockerfile
    p.gitattributes
    p.gitignore
    p.go
    p.gomod
    p.hcl
    p.javascript
    p.json5
    p.lua
    p.make
    p.markdown
    p.nix
    p.prisma
    p.python
    p.rust
    p.svelte
    p.templ
    p.toml
    p.typescript
    p.yaml
    p.nix
    p.tsx
  ]));
  toLua = str: "lua << EOF\n${str}\nEOF\n";
  toLuaFile = file: "lua << EOF\n${builtins.readFile file}\nEOF\n";
in
{
  home.packages = with pkgs; [
    tree-sitter
    eslint_d
    tailwindcss
    ripgrep
    libstdcxx5
    go
    gopls
    fd
    lua-language-server
    rust-analyzer-unwrapped
    openssl
    tailwindcss-language-server
    black
    nodePackages_latest.typescript-language-server
    vscode-langservers-extracted
    luajitPackages.luarocks-nix
    pyright
  ];

  programs.neovim = {
    enable = true;
    vimAlias = true;
    coc.enable = false;
    withNodeJs = true;
    plugins = with pkgs.vimPlugins; [
      nvim-lspconfig
      nvim-cmp
      telescope-fzf-native-nvim
      telescope-nvim
      nvim-ts-context-commentstring
      tokyonight-nvim
      comment-nvim
      luasnip
      cmp-nvim-lsp
      luasnip
      friendly-snippets
      undotree
      fidget-nvim
      harpoon
      vim-nix
      nvim-treesitter-parsers.vimdoc
      neorg
      vim-fugitive


      treesitterWithGrammars
    ];
    extraLuaConfig = ''
      ${builtins.readFile ./nvim/options.lua}
      ${builtins.readFile ./nvim/keymaps.lua}

      vim.defer_fn(
        function()
          vim.cmd [[

          ]]
        end,
        70
      )

      ${builtins.readFile ./nvim/plugins/telescope.lua}
      ${builtins.readFile ./nvim/plugins/lspconfig.lua}
      ${builtins.readFile ./nvim/plugins/comment.lua}
      ${builtins.readFile ./nvim/plugins/undotree.lua}
      ${builtins.readFile ./nvim/plugins/harpoon.lua}
      ${builtins.readFile ./nvim/plugins/treesitter.lua}
      ${builtins.readFile ./nvim/plugins/fugitive.lua}
      ${builtins.readFile ./nvim/plugins/colorscheme.lua}
      ${builtins.readFile ./nvim/plugins/nvim-cmp.lua}
      ${builtins.readFile ./nvim/plugins/snips.lua}
      ${builtins.readFile ./nvim/plugins/neorg.lua}
    '';
    extraPackages = with pkgs; [
      wl-clipboard
	    luajitPackages.lua-lsp
   ];
  };
}
