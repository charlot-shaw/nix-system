let
  user = "sparrows";
in {
  users.users.stasis = {
    isSystemUser = true;
    description = "Syncthing and backup user";
    group = "stasis";
    extraGroups = ["users"];
  };

  systemd.services.syncthing = {
    serviceConfig.UMask = "0007";
  };

  systemd.tmpfiles.rules = [
    "d /home/${user} 0750 ${user} stasis"
  ];
}
