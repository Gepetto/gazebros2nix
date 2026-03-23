{
  nix-ros-overlay,
  ...
}:
{
  config,
  inputs,
  lib,
  self,
  ...
}:
let
  cfg = config.gazebros2nix;
in
{
  imports = [
    inputs.treefmt-nix.flakeModule
    inputs.flakoboros.flakeModule
    {
      flakoboros = {
        overlays = [ self.overlays.gazebros2nix ];
        nixpkgsConfig = {
          allowUnfree = true;
          permittedInsecurePackages = [
            # SHAME
            "freeimage-3.18.0-unstable-2024-04-18"
          ];
        };
        pkgs = false;
      };
    }
  ];

  options.gazebros2nix = {
    patches = lib.mkOption {
      description = "Additionnal patches for gazebros2nix pkgs";
      default = [ ];
    };

    pkgs = lib.mkOption {
      type = lib.types.bool;
      description = "define pkgs from nixpkgs with overlays from nix-ros-overlay, flakoboros, gazebros2nix and overlays";
      default = true;
    };
  };

  config = {
    flake.overlays.gazebros2nix =
      final: prev:
      lib.foldr lib.composeExtensions (_: _: { }) [
        (import ./garbage)
        (import ./generated.nix)
        (import ./todo.nix)
      ] final prev;

    perSystem =
      {
        system,
        ...
      }:
      {
        treefmt = {
          # workaround  https://github.com/numtide/treefmt-nix/issues/352
          pkgs = inputs.nixpkgs.legacyPackages.${system};
          programs = {
            deadnix.enable = true;
            keep-sorted.enable = true;
            nixfmt.enable = true;
          };
        };
      }

      // lib.optionalAttrs cfg.pkgs {
        _module.args.pkgs =
          let
            pkgsForPatching = inputs.nixpkgs.legacyPackages.${system};
            patchedNixpkgs = (
              pkgsForPatching.applyPatches {
                name = "gepetto patched nixpkgs";
                src = inputs.nixpkgs;
                patches = lib.fileset.toList ./patches/NixOS/nixpkgs ++ cfg.patches;
              }
            );
          in
          import patchedNixpkgs {
            inherit system;
            config = config.flakoboros.nixpkgsConfig;
            overlays = [
              nix-ros-overlay.overlays.default
              self.overlays.default
            ]
            ++ config.flakoboros.overlays;
          };
      };
  };
}
