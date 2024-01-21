{pkgs, ...}: {
  users.users = {
    sparrows = {
      isNormalUser = true;
      shell = pkgs.fish;
      # SSH private keys are handled out of band for the moment.
      openssh.authorizedKeys.keyFiles = [
        ../../../identity/id_ed25519.pub
      ];
      extraGroups = ["wheel" "networkmanager"];
      packages = with pkgs; [
        firefox
      ];
    };
  };

  programs.fish.enable = true;
}
