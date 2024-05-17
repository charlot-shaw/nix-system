{pkgs, ...}: {
  users.users.dingo = {
    isNormalUser = true;
    extraGroups = ["wheel" "networkmanager"];
  };
}
