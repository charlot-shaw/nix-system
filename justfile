user := env('USER')
host := shell('hostname')

# Shows all the flake options
show-flake:
    nix flake show

# Switch NixOS and home-manager
build-system: build-os build-hm
    @echo Rebuilt system.

# Switch home-manager
build-hm:
    @echo Updating home-manager generation
    home-manager switch --flake .#{{user}}@{{host}} -b bak

# Switch NixOS
build-os:
    @echo Updating NixOS generation
    nixos-rebuild switch --flake .#{{host}}

# Updates the flake.lock
bump-lock:
    nix flake update

# Updates the flake.lock and rebuilds the system.
bump-system: bump-lock build-system
    @echo Bumped dependencies and rebuilt system.

lint:
    statix check
    deadnix
