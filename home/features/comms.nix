{pkgs, ...}: {
  home.packages = with pkgs; [
    element-desktop
    discord
    telegram-desktop
    tuba
  ];
}
