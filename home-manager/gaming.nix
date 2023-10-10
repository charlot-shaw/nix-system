{pkgs, ...}: {
  home.packages = with pkgs; [
    steam
    nvtop
  ];
}
