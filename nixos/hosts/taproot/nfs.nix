{
  pkgs,
  config,
  ...
}: {
  filesystems."/export/core" = {
    options = ["bind"];
  };

  services.nfs = {
    server.enable = true;
    server.exports = ''
      /export perch(insecure,rw,sync,no_subtree_check,crossmnt,fsid=0)
    '';
  };
}
