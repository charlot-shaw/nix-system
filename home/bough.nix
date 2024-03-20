{
  inputs,
  outputs,
  ...
}: {
  imports = [
    ./base.nix
    ./common/terminal.nix
    ./common/gaming.nix
    ./common/vscode.nix
    ./common/comms.nix
    ./common/hyprland.nix
    ./common/swaylock.nix
    ./common/wpaperd.nix
    ./common/office.nix
    ./common/art.nix
    ./common/pkm.nix
    ./common/screenshot.nix
  ];
}
