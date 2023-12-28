{
  pkgs,
  config,
  ...
}: {
  programs.wpaperd = {
    enable = true;
    settings = {
      default = {
        path = "${config.home.homeDirectory}/walls/";
        duration = "30m";
        sorting = "ascending";
      };
    };
  };
  home.file = {
    "${config.home.homeDirectory}/walls/main.jpg".source = ../../resources/walls/max_muselmann.jpg;
    "${config.home.homeDirectory}/walls/alt.jpg".source = ../../resources/walls/alex_beholder.jpg;
  };
}
