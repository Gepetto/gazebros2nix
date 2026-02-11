{
  inputs = {
    flake-parts.url = "github:hercules-ci/flake-parts";
    gepetto-lib.url = "github:Gepetto/nix-lib";
    nix-ros-overlay.url = "github:lopsided98/nix-ros-overlay/develop";
    nixpkgs.follows = "nix-ros-overlay/nixpkgs";
    systems.follows = "nix-ros-overlay/flake-utils/systems";
    pyproject-build-systems = {
      url = "github:pyproject-nix/build-system-pkgs";
      inputs.pyproject-nix.follows = "pyproject-nix";
      inputs.uv2nix.follows = "uv2nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    pyproject-nix = {
      url = "github:pyproject-nix/pyproject.nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    treefmt-nix = {
      url = "github:numtide/treefmt-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    uv2nix = {
      url = "github:pyproject-nix/uv2nix";
      inputs.pyproject-nix.follows = "pyproject-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs =
    inputs:
    inputs.flake-parts.lib.mkFlake { inherit inputs; } (
      { self, lib, ... }:
      let
        flakeModule = inputs.flake-parts.lib.importApply ./module.nix { localFlake = self; };
      in
      {
        systems = import inputs.systems;
        imports = [ flakeModule ];
        flake = { inherit flakeModule; };
        perSystem =
          {
            pkgs,
            system,
            ...
          }:
          {
            devShells.default = pkgs.mkShell {
              packages = [
                pkgs.gazebros2nix-venv.passthru.editableVirtualenv
              ];
              shellHook = ''
                : ''${GZ_IP:=127.0.0.1}
                : ''${IGN_IP:=127.0.0.1}
                export GZ_IP
                export IGN_IP
                unset QTWEBKIT_PLUGIN_PATH
                unset QT_QPA_PLATFORMTHEME
                unset QML2_IMPORT_PATH
                unset QT_PLUGIN_PATH
                unset QT_STYLE_OVERRIDE

                test -f .venv/bin/activate && source .venv/bin/activate
              '';
            };

            packages = lib.filterAttrs (_n: v: v.meta.available && !v.meta.broken) (
              {
                gz-fortress = pkgs.rosPackages.humble.buildEnv {
                  name = "gz-fortress";
                  postBuild = ''
                    rosWrapperArgs+=(
                    --set QT_QPA_PLATFORM_PLUGIN_PATH ${pkgs.qt5.qtbase.bin}/lib/qt-${pkgs.qt5.qtbase.version}/plugins/platforms
                    --prefix IGN_CONFIG_PATH : "$out/share/ignition"
                    )
                  '';
                  paths = with pkgs.gazebo.fortress; [
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
                    pkgs.qt5.qtgraphicaleffects
                    pkgs.qt5.wrapQtAppsHook
                    sdformat
                    # keep-sorted end
                  ];
                };

                gz-harmonic = pkgs.rosPackages.jazzy.buildEnv {
                  name = "gz-harmonic";
                  paths = with pkgs.gazebo.harmonic; [
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
                    pkgs.qt5.wrapQtAppsHook
                    sdformat
                    # keep-sorted end
                  ];
                };

                gz-ionic = pkgs.rosPackages.jazzy.buildEnv {
                  name = "gz-ionic";
                  paths = with pkgs.gazebo.ionic; [
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
                    pkgs.qt5.wrapQtAppsHook
                    sdformat
                    # keep-sorted end
                  ];
                };

                gz-jetty = pkgs.rosPackages.jazzy.buildEnv {
                  name = "gz-jetty";
                  paths = with pkgs.gazebo.jetty; [
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
                    pkgs.qt6.wrapQtAppsHook
                    sdformat
                    # keep-sorted end
                  ];
                };
              }

              // {
                inherit (pkgs)
                  # keep-sorted start
                  freeimage
                  gazebo2nix
                  ros2nix
                  # keep-sorted end
                  ;
              }

              // lib.mapAttrs' (n: lib.nameValuePair "py-${n}") {
                inherit (pkgs.python3Packages)
                  # keep-sorted start
                  gazebros2nix
                  # keep-sorted end
                  ;
              }

              // lib.mapAttrs' (n: lib.nameValuePair "gz-fortress-${n}") (
                lib.optionalAttrs (system == "x86_64-linux") {
                  inherit (pkgs.gazebo.fortress)
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
              )

              // lib.mapAttrs' (n: lib.nameValuePair "gz-harmonic-${n}") (
                lib.optionalAttrs (system == "x86_64-linux") {
                  inherit (pkgs.gazebo.harmonic)
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
              )

              // lib.mapAttrs' (n: lib.nameValuePair "gz-ionic-${n}") (
                lib.optionalAttrs (system == "x86_64-linux") {
                  inherit (pkgs.gazebo.ionic)
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
                    sdformat
                    # keep-sorted end
                    ;
                }
              )

              // lib.mapAttrs' (n: lib.nameValuePair "gz-jetty-${n}") (
                lib.optionalAttrs (system == "x86_64-linux") {
                  inherit (pkgs.gazebo.jetty)
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
                    sdformat
                    # keep-sorted end
                    ;
                }
              )

              # // lib.mapAttrs' (n: lib.nameValuePair "ros-noetic-${n}") (
              #   lib.optionalAttrs (system == "x86_64-linux") {
              #     inherit (pkgs.rosPackages.noetic)
              #       # keep-sorted start
              #       rosbag
              #       rospy
              #       # keep-sorted end
              #       ;
              #   }
              # )

              // lib.mapAttrs' (n: lib.nameValuePair "ros-humble-${n}") {
                inherit (pkgs.rosPackages.humble)
                  # keep-sorted start
                  agimus-controller
                  agimus-controller-ros
                  agimus-franka-description
                  agimus-msgs
                  linear-feedback-controller
                  linear-feedback-controller-msgs
                  tiago-pro-description
                  # tiago-pro-gazebo TODO: gazebo-classic
                  # keep-sorted end
                  ;
              }

              // lib.mapAttrs' (n: lib.nameValuePair "ros-jazzy-${n}") {
                inherit (pkgs.rosPackages.jazzy)
                  # keep-sorted start
                  agimus-controller
                  agimus-controller-ros
                  agimus-franka-description
                  agimus-msgs
                  linear-feedback-controller
                  linear-feedback-controller-msgs
                  ros2-control-demo-description
                  ros2-control-demo-example-1
                  ros2-control-demo-example-10
                  ros2-control-demo-example-11
                  ros2-control-demo-example-12
                  ros2-control-demo-example-13
                  ros2-control-demo-example-14
                  ros2-control-demo-example-15
                  ros2-control-demo-example-16
                  # ros2-control-demo-example-17 # error: 'control_msgs' has not been declared
                  ros2-control-demo-example-2
                  ros2-control-demo-example-3
                  ros2-control-demo-example-4
                  ros2-control-demo-example-5
                  ros2-control-demo-example-6
                  ros2-control-demo-example-7
                  ros2-control-demo-example-8
                  # ros2-control-demo-example-9 # need to fix gz-sim-vendor first
                  # ros2-control-demos # need the other ones
                  # keep-sorted end
                  ;
              }

              // lib.mapAttrs' (n: lib.nameValuePair "ros-kilted-${n}") {
                inherit (pkgs.rosPackages.kilted)
                  # keep-sorted start
                  agimus-controller
                  agimus-controller-ros
                  agimus-franka-description
                  agimus-msgs
                  linear-feedback-controller
                  linear-feedback-controller-msgs
                  # keep-sorted end
                  ;
              }

              // lib.mapAttrs' (n: lib.nameValuePair "ros-rolling-${n}") {
                inherit (pkgs.rosPackages.rolling)
                  # keep-sorted start
                  agimus-controller
                  agimus-controller-ros
                  agimus-franka-description
                  agimus-msgs
                  linear-feedback-controller
                  linear-feedback-controller-msgs
                  # keep-sorted end
                  ;
              }
            );

            treefmt = {
              settings.global.excludes = [
                ".envrc"
                ".git-blame-ignore-revs"
                "LICENSE"
              ];
              programs = {
                # keep-sorted start
                mdformat.enable = true;
                yamlfmt.enable = true;
                # keep-sorted end
              };
            };
          };
      }
    );
}
