{pkgs, ...}: {
  home.packages = with pkgs; [
    nvtop
    mangohud
    vulkan-tools
    steam
  ];

}
