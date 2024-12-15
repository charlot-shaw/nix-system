{pkgs, ...}: {
  home.packages = with pkgs; [
    nvtopPackages.full
    mangohud
    vulkan-tools
    steam
    steam-run
    atlauncher
    prismlauncher
    lutris
    heroic
  ];
}
