{
  config,
  pkgs,
  ...
}: {
  # https://discourse.nixos.org/t/nixos-rebuild-switch-upgrade-networkmanager-wait-online-service-failure/30746
  systemd.services.NetworkManager-wait-online.enable = pkgs.lib.mkForce false;
}
