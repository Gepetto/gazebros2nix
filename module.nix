{ localFlake }:
{
  config,
  inputs,
  lib,
  ...
}:
{
  imports = [ inputs.treefmt-nix.flakeModule ];

  options.gazebros2nix-pkgs = {
    overlays = lib.mkOption {
      default = [ ];
      description = "Additionnal overlays for gazebros2nix";
    };
    patches = lib.mkOption {
      default = [ ];
      description = "Additionnal patches for gazebros2nix";
    };
  };

  config = {
    perSystem =
      { self', system, ... }:
      {
        _module.args.pkgs =
          let
            pkgsForPatching = inputs.nixpkgs.legacyPackages.${system};
            patchedNixpkgs = (
              pkgsForPatching.applyPatches {
                name = "gepetto patched nixpkgs";
                src = inputs.nixpkgs;
                patches = lib.fileset.toList ./patches/NixOS/nixpkgs ++ config.gazebros2nix-pkgs.patches;
              }
            );
          in
          import patchedNixpkgs {
            inherit system;
            config.allowUnfree = true;
            config.permittedInsecurePackages = [
              # SHAME
              "freeimage-3.18.0-unstable-2024-04-18"
            ];
            overlays = [
              inputs.nix-ros-overlay.overlays.default
              (final: prev: {
                inherit (inputs) pyproject-build-systems pyproject-nix uv2nix;
                lib =
                  prev.lib
                  // (prev.lib.mapAttrs (_name: value: value final) ({
                    inherit (localFlake.inputs.gepetto-lib.lib) pythonVersion rosVersion;
                  }));
                gazebo = prev.lib.filesystem.packagesFromDirectoryRecursive {
                  inherit (final) callPackage newScope;
                  directory = ./gazebo-pkgs;
                };
              })
              (import ./overlay.nix { })
            ]
            ++ config.gazebros2nix-pkgs.overlays;
          };
        checks =
          let
            devShells = lib.mapAttrs' (n: lib.nameValuePair "devShell-${n}") self'.devShells;
            packages = lib.mapAttrs' (n: lib.nameValuePair "package-${n}") self'.packages;
          in
          lib.filterAttrs (_n: v: v.meta.available && !v.meta.broken) (devShells // packages);
        treefmt = {
          # workaround  https://github.com/numtide/treefmt-nix/issues/352
          pkgs = inputs.nixpkgs.legacyPackages.${system};
          programs = {
            deadnix.enable = true;
            keep-sorted.enable = true;
            nixfmt.enable = true;
          };
        };
      };
  };
}
