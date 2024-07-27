{
  config,
  pkgs,
}: {
  # https://discourse.nixos.org/t/rebuild-error-failed-to-start-network-manager-wait-online/41977
  systemd.network.wait-online.enable = false;
  boot.initrd.systemd.network.wait-online.enable = false;
}
