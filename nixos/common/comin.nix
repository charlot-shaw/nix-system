{config, ...}: {
  services.comin = {
    enable = true;
    remotes = [
      {
        name = "origin";
        url = "https://github.com/charlot-shaw/nix-system";
      }
    ];
  };
}
