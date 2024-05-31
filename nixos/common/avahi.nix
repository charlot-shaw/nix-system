{pkgs, lib, config, ...}:{

    options = {
        sparrows.avahi.enable = lib.mkEnableOption "Turns on Avahi for local service discovery.";
    };

    config = {
        lib.mkIf = config.sparrows.avahi.enable {

            services.avahi = {
                enable = true;
            
                publish = {
                    enable = true;
                    userServices = true;
                };
            };
        };
    };
}