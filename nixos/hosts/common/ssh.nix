{...}: {
  services.openssh = {
    enable = true;
    settings = {
      PermitRootLogin = "no";
      PasswordAuthentication = false;

      authorizedKeysFiles = [
        "~/.ssh/id_ed25519.pub"
      ];
    };
  };

  programs.ssh.startAgent = true;
}
