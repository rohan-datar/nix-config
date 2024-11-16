{
  config,
  pkgs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    alejandra
    kitty
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
  ];

  fonts.packages = with pkgs; [
    maple-mono-NF
    (nerdfonts.override {fonts = ["FiraCode" "JetBrainsMono" "Meslo" "Hack"];})
    font-awesome
  ];
}
