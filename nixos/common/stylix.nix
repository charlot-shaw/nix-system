{
  stylix,
  pkgs,
  ...
}: {
  stylix = {
    enable = true;
    image = ./../../mihael_stojcevic_sddm_backdrop.png;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/sandcastle.yaml";
  };
}
