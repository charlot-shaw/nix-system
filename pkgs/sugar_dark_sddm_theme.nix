{
  pkgs,
  background ? "Background.jpg",
  mainColor ? "navajowhite",
  accentColor ? "white",
}:
# With thanks to Vimjoyer. https://www.youtube.com/watch?v=m_6eqpKrtxk
pkgs.stdenv.mkDerivation rec {
  name = "sugar-dark-sddm-theme";

  src = pkgs.fetchFromGitHub {
    owner = "MarianArlt";
    repo = "sddm-sugar-dark";
    rev = "ceb2c455663429be03ba62d9f898c571650ef7fe";
    sha256 = "0153z1kylbhc9d12nxy9vpn0spxgrhgy36wy37pk6ysq7akaqlvy";
  };

  configOverride = pkgs.writeText "theme.tst" ''
    [General]
    Background = "${background}"

    MainColor = "${mainColor}"
    AccentColor = "${accentColor}"
  '';

  patchPhase = ''
    cp $configOverride ./theme.toml
  '';

  installPhase = ''
    mkdir -p $out
    cp -R ./* $out/
  '';
}
