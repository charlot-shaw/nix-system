{
  config,
  lib,
  inputs,
  outputs,
  namespace,
  ...
}:
with lib.${namespace}; {
  lib.${namespace} = {
    editors.vscode.enable = true;
  };

  home.stateVersion = "24.05";
}
