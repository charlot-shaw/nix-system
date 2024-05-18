{...}: {
  imports = [
    ../../resources/hosts.nix
  ];

  services.openssh = {
    enable = true;
    settings = {
      PermitRootLogin = "no";
      PasswordAuthentication = false;
    };
  };

  programs.ssh.startAgent = true;
}
