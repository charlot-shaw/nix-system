{
  inputs,
  pkgs,
  ...
}: {
  # Default utility packages.

  environment.systemPackages = with pkgs; [
    vim
    tar
    eza
    ripgrep
    gdu
    bat
    git
    unzip
    wget
    curl
    killall
    htop
  ];
}
