{
  config,
  pkgs,
  inputs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    # ghostty
    alejandra
    neofetch
    bat
    python3
    coreutils
    codespell
    fd
    fzf
    git
    go
    jq
    lazygit
    neovim
    ripgrep
    shellcheck
    tmux
    wget
    yamllint
    yq
    zoxide
    zsh
    pstree
    starship
    nix-index
    obsidian
    discord
    sourcekit-lsp
    zig
    tree-sitter
    aoc-cli
    inputs.agenix.packages.${system}.default
    lldb
    lua-language-server
    stylua
    javaCup
    jflex
    jdt-language-server
    btop
    bat
    man-pages
    man-pages-posix
  ];

  fonts.packages = with pkgs; [
    maple-mono.NF
    nerd-fonts.fira-code
    nerd-fonts.jetbrains-mono
    nerd-fonts.meslo-lg
    nerd-fonts.hack
    font-awesome
  ];

  documentation = {
    enable = true;
    man.enable = true;
    info.enable = true;
  };
}
