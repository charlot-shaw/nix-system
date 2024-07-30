{pkgs, ...}: {
  users.users.sparrows = {
    isNormalUser = true;
    shell = pkgs.fish;
    # SSH private keys are handled out of band for the moment.
    openssh.authorizedKeys.keyFiles = [
      ../resources/keys/sparrows_id_ed25519.pub
    ];
    initialPassword = "change-me-sight-away";
    extraGroups = ["wheel" "networkmanager"];
  };
}
