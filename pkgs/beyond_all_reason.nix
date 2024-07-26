{ appimageTools, fetchurl,lib }:
let
  pname = "Beyond-All-Reason";
  version = "1.2988.0";
  lower-name = lib.strings.toLower pname;

  src = fetchurl {
    url = "https://github.com/beyond-all-reason/BYAR-Chobby/releases/download/v${version}/${lower-name}-${version}.AppImage";
    hash = "sha256-ZJW5BdxxqyrM2TJTO0SBp4BXt3ILyi77EZx73X8hqJE=";
  };
in
appimageTools.wrapType2 {
  inherit pname version src;
  extraPkgs = pkgs: [
    pkgs.openal
  ];
}
