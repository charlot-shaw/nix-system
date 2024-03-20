{
  pkgs,
  config,
  ...
}: {
  services.xserver.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
    theme = "${pkgs.callPackage ../../../pkgs/sugar_dark_sddm_theme.nix
      {
        background = "../../..resources/walls/mihael_stojcevic_sddm_backdrop.png";
        accentColor = "red";
      }}";
  };

  environment.systemPackages = with pkgs; [
    libsForQt5.qt5.qtgraphicaleffects
  ];
}
