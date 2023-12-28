{
  inputs,
  outputs,
  ...
}: {
  imports = [
    ./base.nix
    ./features/terminal.nix
    ./features/gaming.nix
    ./features/vscode.nix
    ./features/comms.nix
    ./features/hyprland.nix
    ./features/swaylock.nix
    ./features/wpaperd.nix
    ./features/office.nix
    ./features/art.nix
  ];
}
