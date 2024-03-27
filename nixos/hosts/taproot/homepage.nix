{config,...}: {
  services.homepage-dashboard = {
    enable = true;
  
   services = [
    {"System" = [
        "Grafana" = {

        href = config.services.grafana.domain;
        description = "Graphing and Notifications";
        };
    ];
    }
    ];
    }
  };

