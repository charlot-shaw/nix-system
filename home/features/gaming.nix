{pkgs, ...}: {
  home.packages = with pkgs; [
    steam
    nvtop
    mangohud
    vulkan-tools
  ];
}
