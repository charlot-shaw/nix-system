# Custom packages, that can be defined similarly to ones from nixpkgs
# You can build them using 'nix build .#example'
{pkgs, ...}: {
  # example = pkgs.callPackage ./example { };
  sddm-theme = pkgs.callPackage ./sugar_dark_sddm_theme.nix {};
  beyond-all-reason = pkgs.callPackage ./beyond_all_reason.nix {};
}
