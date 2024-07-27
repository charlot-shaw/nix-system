{
  pkgs,
  lib,
  config,
  ...
}: {
  options = {
    sparrows.avahi = {
      enable = lib.mkEnableOption "Turns on Avahi for local service discovery.";

      publish = lib.mkOption {
        type = lib.types.bool;
        default = false;
        description = "Whether to publish local services";
      };
    };
  };

  config = {
    lib.mkIf = config.sparrows.avahi.enable {
      services.avahi = {
        enable = true;

        nssmdns4 = true;

        publish = lib.mkIf config.sparrows.avahi.publish {
          enable = true;
          userServices = true;
        };
      };
    };
  };
}
