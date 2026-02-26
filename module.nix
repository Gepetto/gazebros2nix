{ localFlake }:
{
  config,
  inputs,
  lib,
  ...
}:
{
  imports = [ inputs.treefmt-nix.flakeModule ];

  options.gazebros2nix = {
    overlays = lib.mkOption {
      description = "Additionnal overlays for gazebros2nix";
      default = [ ];
    };
    patches = lib.mkOption {
      description = "Additionnal patches for gazebros2nix";
      default = [ ];
    };
    packages = lib.mkOption {
      description = "attrSet of packages name/override to add in overlay";
      default = { };
    };
    pyPackages = lib.mkOption {
      description = "attrSet of python packages name/override to add in overlay";
      default = { };
    };
    rosPackages = lib.mkOption {
      description = "attrSet of ROS packages name/override to add in overlay";
      default = { };
    };
    rosDistros = lib.mkOption {
      description = "List of ROS distributions to consider for rosPackages overlay";
      default = [
        "humble"
        "jazzy"
        "kilted"
        "rolling"
      ];
    };
    rosShellDistro = lib.mkOption {
      description = "The ROS distributions of the default devShell";
      default = "rolling";
    };
  };

  config =
    let
      rosWrapperArgs =
        distro: pkgs:
        ''
          rosWrapperArgs+=(
          --unset QTWEBKIT_PLUGIN_PATH
          --unset QT_QPA_PLATFORMTHEME
          --unset QML2_IMPORT_PATH
          --unset QT_PLUGIN_PATH
          --unset QT_STYLE_OVERRIDE
          --prefix AMENT_PREFIX_PATH : $out
          --prefix LD_LIBRARY_PATH : $out/lib
        ''
        + lib.optionalString (distro == "humble") ''
          --set-default IGN_IP 127.0.0.1
          --prefix IGN_CONFIG_PATH : $out/share/ignition
        ''
        + lib.optionalString (distro == "humble" || distro == "jazzy" || distro == "kilted") ''
          --set QT_QPA_PLATFORM_PLUGIN_PATH ${pkgs.qt5.qtbase.bin}/lib/qt-${pkgs.qt5.qtbase.version}/plugins/platforms
        ''
        + lib.optionalString (distro != "humble") ''
          --set-default GZ_IP 127.0.0.1
        ''
        + ''
          )
        '';

      rosShellHook =
        {
          env ? null,
        }:
        ''
          : ''${GZ_IP:=127.0.0.1}
          : ''${IGN_IP:=127.0.0.1}
          export GZ_IP
          export IGN_IP
          unset QTWEBKIT_PLUGIN_PATH
          unset QT_QPA_PLATFORMTHEME
          unset QML2_IMPORT_PATH
          unset QT_PLUGIN_PATH
          unset QT_STYLE_OVERRIDE
        ''
        + lib.optionalString (env != null) ''
          export AMENT_PREFIX_PATH=${env}:''${AMENT_PREFIX_PATH:+:$AMENT_PREFIX_PATH}
          export LD_LIBRARY_PATH=${env}/lib:''${LD_LIBRARY_PATH:+:$LD_LIBRARY_PATH}
          export IGN_CONFIG_PATH=${env}/share/ignition:''${IGN_CONFIG_PATH:+:$IGN_CONFIG_PATH}
        ''
        + ''
          test -f install/local_setup.bash && source install/local_setup.bash
        '';

    in
    {
      flake.lib = {
        inherit rosWrapperArgs rosShellHook;
      };

      perSystem =
        {
          pkgs,
          self',
          system,
          ...
        }:
        {
          _module.args.pkgs =
            let
              pkgsForPatching = inputs.nixpkgs.legacyPackages.${system};
              patchedNixpkgs = (
                pkgsForPatching.applyPatches {
                  name = "gepetto patched nixpkgs";
                  src = inputs.nixpkgs;
                  patches = lib.fileset.toList ./patches/NixOS/nixpkgs ++ config.gazebros2nix.patches;
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

                (
                  final: prev:
                  (lib.mapAttrs (
                    package: override: prev.${package}.overrideAttrs (override final)
                  ) config.gazebros2nix.packages)
                  // {
                    pythonPackagesExtensions = prev.pythonPackagesExtensions ++ [
                      (
                        python-final: python-prev:
                        lib.mapAttrs (
                          package: override: python-prev.${package}.overrideAttrs (override final python-final)
                        ) config.gazebros2nix.pyPackages
                      )
                    ];

                    rosPackages =
                      prev.rosPackages
                      // lib.genAttrs config.gazebros2nix.rosDistros (
                        distro:
                        prev.rosPackages.${distro}.overrideScope (
                          ros-final: ros-prev:
                          lib.mapAttrs (
                            package: override: ros-prev.${package}.overrideAttrs (override final ros-final)
                          ) config.gazebros2nix.rosPackages
                        )
                      );
                  }
                )
              ]
              ++ config.gazebros2nix.overlays;
            };

          # Build all available packages and devShells. Useful for CI.
          checks =
            let
              devShells = lib.mapAttrs' (n: lib.nameValuePair "devShell-${n}") self'.devShells;
              packages = lib.mapAttrs' (n: lib.nameValuePair "package-${n}") self'.packages;
            in
            lib.filterAttrs (_n: v: v.meta.available && !v.meta.broken) (devShells // packages);

          devShells = {
            default = lib.mkDefault (
              if (config.gazebros2nix.rosPackages == { }) then
                self'.devShells.gazebros2nix-dev
              else
                self'.devShells.gazebros2nix-dev-ros
            );

            gazebros2nix = pkgs.mkShell {
              name = "gazebros2nix default shell";
              packages = lib.attrValues (
                lib.filterAttrs (
                  n: _v:
                  ((!lib.hasPrefix "ros-" n) || lib.hasPrefix "ros-${config.gazebros2nix.rosShellDistro}-" n)
                  && (n != "default")
                ) self'.packages
              );
            };

            gazebros2nix-env = pkgs.rosPackages.${config.gazebros2nix.rosShellDistro}.buildEnv {
              paths = lib.filter lib.isDerivation (
                lib.unique (
                  (self'.devShells.gazebros2nix.buildInputs or [ ])
                  ++ (self'.devShells.gazebros2nix.nativeBuildInputs or [ ])
                  ++ (self'.devShells.gazebros2nix.propagatedNativeBuildInputs or [ ])
                  ++ (self'.devShells.gazebros2nix.propagatedBuildInputs or [ ])
                )
              );
              postBuild = rosWrapperArgs config.gazebros2nix.rosShellDistro pkgs;
            };

            gazebros2nix-ros = pkgs.mkShell {
              name = "gazebros2nix default ROS shell";
              packages = [
                self'.devShells.gazebros2nix
                pkgs.colcon
              ];
              shellHook = rosShellHook { env = self'.devShells.gazebros2nix-env; };
            };

            gazebros2nix-dev = pkgs.mkShell {
              name = "gazebros2nix default devShell";
              inputsFrom = lib.attrValues (
                lib.filterAttrs (
                  n: _v:
                  ((!lib.hasPrefix "ros-" n) || lib.hasPrefix "ros-${config.gazebros2nix.rosShellDistro}-" n)
                  && (n != "default")
                ) self'.packages
              );
            };

            gazebros2nix-dev-env = pkgs.rosPackages.${config.gazebros2nix.rosShellDistro}.buildEnv {
              paths = lib.filter lib.isDerivation (
                lib.unique (
                  (self'.devShells.gazebros2nix-dev.buildInputs or [ ])
                  ++ (self'.devShells.gazebros2nix-dev.nativeBuildInputs or [ ])
                  ++ (self'.devShells.gazebros2nix-dev.propagatedNativeBuildInputs or [ ])
                  ++ (self'.devShells.gazebros2nix-dev.propagatedBuildInputs or [ ])
                )
              );
            };

            gazebros2nix-dev-ros = pkgs.mkShell {
              name = "gazebros2nix default ROS devShell";
              inputsFrom = [ self'.devShells.gazebros2nix-dev ];
              packages = [ pkgs.colcon ];
              shellHook = rosShellHook { env = self'.devShells.gazebros2nix-dev-env; };
            };
          };

          # expose packages configured by consumer in gazebros2nix.{packages,pyPackages,rosPackages}
          packages = {
            default = lib.mkDefault self'.devShells.gazebros2nix-env;
          }
          // (lib.mapAttrs (package: _override: pkgs.${package}) config.gazebros2nix.packages)
          // (lib.mapAttrs' (
            package: _override: lib.nameValuePair "py-${package}" pkgs.python3Packages.${package}
          ) config.gazebros2nix.pyPackages)
          // (lib.listToAttrs (
            lib.mapCartesianProduct
              (
                { distro, package }:
                lib.nameValuePair "ros-${distro}-${package}" pkgs.rosPackages.${distro}.${package}
              )
              {
                distro = config.gazebros2nix.rosDistros;
                package = lib.attrNames config.gazebros2nix.rosPackages;
              }
          ));

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
