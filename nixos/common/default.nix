{...}: {
  imports = [
    ./utilities.nix
    ./configuration_structure.nix
    ./ssh.nix
    ./comin.nix
    ./locale.nix
    ./shells.nix
    ./prometheus_node_exporter.nix
    ./network.nix
  ];
}
