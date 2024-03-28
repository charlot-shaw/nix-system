{config, ...}: {
  services.homepage-dashboard = {
    enable = true;
    listenPort = 8082; 
    settings = {
      title = "Sparrownet";
      headerStyle = "boxedWidgets";
    };

    widgets = [
      {
        resources = {
          cpu = true;
          disk = "/";
          memory = true;
        };
      }
      {
        search = {
          provider = "duckduckgo";
          target = "_blank";
        };
      }
    ];

    services = [
      {
        "System" = [
          {
            "Grafana" = {
              href = "/";
              description = "Graphing and Notifications";
            };
          }
        ];
      }
    ];
  };
}
