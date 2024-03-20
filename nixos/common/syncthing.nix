{...}: {
  services.syncthing = {
    enable = true;

    settings.folders.core = {
      enable = true;
      path = "~/core_test";
    };
  };
}
