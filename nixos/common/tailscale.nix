{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    tailscale
  ];

  services.tailscale.enable = true;
  # https://github.com/tailscale/tailscale/issues/4254
  # keep an eye on this if Tailscale acts up.
}
