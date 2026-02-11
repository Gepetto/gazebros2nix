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

                pythonPackagesExtensions = prev.pythonPackagesExtensions ++ [
                  (
                    python-final: _python-prev:
                    final.lib.filesystem.packagesFromDirectoryRecursive {
                      inherit (python-final) callPackage;
                      directory = ./py-pkgs;
                    }
                  )
                ];

                rosPackages = prev.rosPackages // {
                  humble = prev.rosPackages.humble.overrideScope (
                    humble-final: _humble-prev:
                    final.lib.filesystem.packagesFromDirectoryRecursive {
                      inherit (humble-final) callPackage;
                      directory = ./ros-pkgs/humble;
                    }
                    // {
                      inherit (final.gazebo.fortress)
                        # keep-sorted start
                        gz-cmake
                        gz-common
                        gz-fuel-tools
                        gz-gui
                        gz-launch
                        gz-math
                        gz-msgs
                        gz-physics
                        gz-plugin
                        gz-rendering
                        gz-sensors
                        gz-sim
                        gz-tools
                        gz-transport
                        gz-utils
                        ign-cmake2
                        ign-common4
                        ign-fuel-tools7
                        ign-gazebo6
                        ign-gui6
                        ign-launch5
                        ign-math6
                        ign-msgs8
                        ign-physics5
                        ign-plugin1
                        ign-rendering6
                        ign-sensors6
                        ign-tools1
                        ign-transport11
                        ign-utils1
                        sdformat
                        sdformat12
                        # keep-sorted end
                        ;

                    }
                  );

                  jazzy = prev.rosPackages.jazzy.overrideScope (
                    jazzy-final: _jazzy-prev:
                    final.lib.filesystem.packagesFromDirectoryRecursive {
                      inherit (jazzy-final) callPackage;
                      directory = ./ros-pkgs/jazzy;
                    }
                    // {
                      inherit (final.gazebo.harmonic)
                        # keep-sorted start
                        gz-cmake
                        gz-cmake3
                        gz-common
                        gz-common5
                        gz-fuel-tools
                        gz-fuel-tools9
                        gz-gui
                        gz-gui8
                        gz-launch
                        gz-launch7
                        gz-math
                        gz-math7
                        gz-msgs
                        gz-msgs10
                        gz-physics
                        gz-physics7
                        gz-plugin
                        gz-plugin2
                        gz-rendering
                        gz-rendering8
                        gz-sensors
                        gz-sensors8
                        gz-sim
                        gz-sim8
                        gz-tools
                        gz-tools2
                        gz-transport
                        gz-transport13
                        gz-utils
                        gz-utils2
                        sdformat
                        sdformat14
                        # keep-sorted end
                        ;

                    }
                  );

                  kilted = prev.rosPackages.kilted.overrideScope (
                    kilted-final: _kilted-prev:
                    final.lib.filesystem.packagesFromDirectoryRecursive {
                      inherit (kilted-final) callPackage;
                      directory = ./ros-pkgs/kilted;
                    }
                    // {
                      inherit (final.gazebo.ionic)
                        # keep-sorted start
                        gz-cmake
                        gz-cmake4
                        gz-common
                        gz-common6
                        gz-fuel-tools
                        gz-fuel-tools10
                        gz-gui
                        gz-gui9
                        gz-launch
                        gz-launch8
                        gz-math
                        gz-math8
                        gz-msgs
                        gz-msgs11
                        gz-physics
                        gz-physics8
                        gz-plugin
                        gz-plugin3
                        gz-rendering
                        gz-rendering9
                        gz-sensors
                        gz-sensors9
                        gz-sim
                        gz-sim9
                        gz-tools
                        gz-tools2
                        gz-transport
                        gz-transport14
                        gz-utils
                        gz-utils3
                        sdformat
                        sdformat15
                        # keep-sorted end
                        ;
                    }
                  );

                  rolling = prev.rosPackages.rolling.overrideScope (
                    rolling-final: _rolling-prev:
                    final.lib.filesystem.packagesFromDirectoryRecursive {
                      inherit (rolling-final) callPackage;
                      directory = ./ros-pkgs/rolling;
                    }
                    // {
                      inherit (final.gazebo.jetty)
                        # keep-sorted start
                        gz-cmake
                        gz-cmake5
                        gz-common
                        gz-common7
                        gz-fuel-tools
                        gz-fuel-tools11
                        gz-gui
                        gz-gui10
                        gz-launch
                        gz-launch9
                        gz-math
                        gz-math9
                        gz-msgs
                        gz-msgs12
                        gz-physics
                        gz-physics9
                        gz-plugin
                        gz-plugin4
                        gz-rendering
                        gz-rendering10
                        gz-sensors
                        gz-sensors10
                        gz-sim
                        gz-sim10
                        gz-tools
                        gz-tools2
                        gz-transport
                        gz-transport15
                        gz-utils
                        gz-utils4
                        sdformat
                        sdformat16
                        # keep-sorted end
                        ;
                    }
                  );
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
