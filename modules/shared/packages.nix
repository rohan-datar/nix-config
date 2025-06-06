{
  config,
  pkgs,
  inputs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    firefox
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
    lazygit
    neovim
    ripgrep
    tmux
    wget
    zoxide
    zsh
    pstree
    starship
    nix-index
    obsidian
    discord
    zig
    tree-sitter
    aoc-cli
    inputs.agenix.packages.${system}.default
    lldb
    btop
    bat
    man-pages
    man-pages-posix
    pkl
    direnv
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
