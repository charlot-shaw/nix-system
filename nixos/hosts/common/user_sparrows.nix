{pkgs, ...}: {
  users.users = {
    sparrows = {
      isNormalUser = true;
      shell = pkgs.fish;
      # SSH private keys are handled out of band for the moment.
      openssh.authorizedKeys.keyFiles = [
        ../../../resources/keys/sparrows_id_ed25519.pub
      ];
      extraGroups = ["wheel" "networkmanager"];
      packages = with pkgs; [
        firefox
        audacity
      ];
    };
  };

  programs.fish.enable = true;
}
