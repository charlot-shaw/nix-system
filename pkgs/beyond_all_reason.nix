{ appimageTools, fetchurl }:
let
  pname = "Beyond All Reason";
  version = "1.2988.0";

  src = fetchurl {
    url = "https://github.com/beyond-all-reason/BYAR-Chobby/releases/download/v${version}/${pname}-${version}.AppImage";
    hash = "sha256-he1uGC1M/nFcKpMM9JKY4oeexJcnzV0ZRxhTjtJz6xw=";
  };
in
appimageTools.wrapType2 {
  inherit pname version src;
}