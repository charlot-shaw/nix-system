# All the NixOS configurations
{
  perch = import ./hosts/perch/perch.nix;
  bough = import ./hosts/bough/bough.nix;
  taproot = import ./hosts/taproot/taproot.nix;
}
