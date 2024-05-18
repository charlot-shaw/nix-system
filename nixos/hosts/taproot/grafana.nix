{
  config,
  pkgs,
  ...
}: {
  services.grafana = {
    enable = true;
    settings.server = {
      domain = "grafana.taproot";
      http_port = 2342;
      http_addr = "127.0.0.1";
    };
  };

  services.nginx.enable = true;

  services.nginx.virtualHosts.${config.services.grafana.settings.server.domain} = {
    locations."/" = {
      proxyPass = "http://127.0.0.1:${toString config.services.grafana.settings.server.http_port}";
      proxyWebsockets = true;
    };
  };
}
