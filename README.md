# Sparrow's NixOS Configs.

This is the configuration for Sparrow's personal NixOS and home-manager configurations. It was originally based off of Misterio77's starter configuration, but is evolving in it's own direction.

This README is mostly for Sparrow's notes and internal guides.


## Theming standards right now.
Use the theme manager wherever applicable.

[Base16 semantics](https://github.com/chriskempson/base16/blob/main/styling.md) apply, with the following having codified generalizations.

```
  base00: The background color for large, non-interactive areas
  base01: The background color of principal interactive areas
  base03: The color of dividers, borders, etc.
  base04: The neutral text color
  base0A: The positive text color
  base0D: The call-to-action text color
  base0F: The warning text color
```
* Borders are 2px
* Border radii are 10px

## Helpful Resources

[Xe](https://xeiaso.net/blog/nix-flakes-1-2022-02-21/)'s blog has a great series.
[NixOS & Flakes Book](https://nixos-and-flakes.thiscute.world/) is invaluable.
[Tweag](https://www.tweag.io/blog/2020-05-25-flakes/) has some good information.

## ToDo

* Settle on organizational principles
  * Are features to be imported file by file? Should they be custom packages? What about the `hosts/common/` directory?
  * How smart/modular should they be? (IE, should they be expected to handle their own interlinking? How parametrized should they be.)
  * Unite all non-code assets under `resources/*`, keys, walls, etc.
* Finish work on base clojure template.
* Nixify further hosts.
* Figure out SSH keys and how they should be distributed accross hosts.
  * This also includes how the hosts own keys should be handled.