{
  inputs,
  pkgs,
  ...
}: {
  # Default utility packages.

  environment.systemPackages = with pkgs; [
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
