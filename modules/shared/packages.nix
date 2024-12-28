{
  config,
  pkgs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    alejandra
    # kitty
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
    tailscale
    sourcekit-lsp
    zig
    tree-sitter
    aoc-cli
  ];

  fonts.packages = with pkgs; [
    maple-mono-NF
    nerd-fonts.fira-code
    nerd-fonts.jetbrains-mono
    nerd-fonts.meslo-lg
    nerd-fonts.hack
    font-awesome
  ];
}
