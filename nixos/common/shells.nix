{pkgs, ...}: {
  # Shells
  # see https://nixos.wiki/wiki/Command_Shell
  environment.shells = with pkgs; [bash fish];
  programs.fish.enable = true;
}
