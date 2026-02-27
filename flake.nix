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
            self',
            system,
            ...
          }:
          {
            devShells.default = pkgs.mkShell {
              packages = [
                pkgs.gazebros2nix-venv.passthru.editableVirtualenv
              ];
              shellHook = self.lib.rosShellHook { } + ''
                test -f .venv/bin/activate && source .venv/bin/activate
              '';
            };

            packages = lib.filterAttrs (_n: v: v.meta.available && !v.meta.broken) (
              {
                default = pkgs.gazebros2nix-venv.passthru.virtualenv;

                gz-fortress = pkgs.rosPackages.humble.buildEnv {
                  name = "gz-fortress";
                  postBuild = self.lib.rosWrapperArgs "humble" pkgs;
                  paths = lib.attrValues (lib.filterAttrs (n: _p: lib.hasPrefix "gz-fortress-" n) self'.packages) ++ [
                    pkgs.qt5.qtgraphicaleffects
                    pkgs.qt5.wrapQtAppsHook
                  ];
                };

                gz-harmonic = pkgs.rosPackages.jazzy.buildEnv {
                  name = "gz-harmonic";
                  postBuild = self.lib.rosWrapperArgs "jazzy" pkgs;
                  paths = lib.attrValues (lib.filterAttrs (n: _p: lib.hasPrefix "gz-harmonic-" n) self'.packages) ++ [
                    pkgs.qt5.wrapQtAppsHook
                  ];
                };

                gz-ionic = pkgs.rosPackages.kilted.buildEnv {
                  name = "gz-ionic";
                  postBuild = self.lib.rosWrapperArgs "kilted" pkgs;
                  paths = lib.attrValues (lib.filterAttrs (n: _p: lib.hasPrefix "gz-ionic-" n) self'.packages) ++ [
                    pkgs.qt5.wrapQtAppsHook
                  ];
                };

                gz-jetty = pkgs.rosPackages.rolling.buildEnv {
                  name = "gz-jetty";
                  postBuild = self.lib.rosWrapperArgs "rolling" pkgs;
                  paths = lib.attrValues (lib.filterAttrs (n: _p: lib.hasPrefix "gz-jetty-" n) self'.packages) ++ [
                    pkgs.qt6.wrapQtAppsHook
                  ];
                };

                ros-humble = pkgs.rosPackages.humble.buildEnv {
                  name = "ros-humble";
                  postBuild = self.lib.rosWrapperArgs "humble" pkgs;
                  paths = lib.attrValues (lib.filterAttrs (n: _p: lib.hasPrefix "ros-humble-" n) self'.packages) ++ [
                    pkgs.python3Packages.coal # TODO
                    pkgs.qt5.qtgraphicaleffects
                    pkgs.qt5.wrapQtAppsHook
                  ];
                };

                ros-jazzy = pkgs.rosPackages.jazzy.buildEnv {
                  name = "ros-jazzy";
                  postBuild = self.lib.rosWrapperArgs "jazzy" pkgs;
                  paths = lib.attrValues (lib.filterAttrs (n: _p: lib.hasPrefix "ros-jazzy-" n) self'.packages) ++ [
                    pkgs.qt5.wrapQtAppsHook
                  ];
                };

                ros-kilted = pkgs.rosPackages.kilted.buildEnv {
                  name = "ros-kilted";
                  postBuild = self.lib.rosWrapperArgs "kilted" pkgs;
                  paths = lib.attrValues (lib.filterAttrs (n: _p: lib.hasPrefix "ros-kilted-" n) self'.packages) ++ [
                    pkgs.qt5.wrapQtAppsHook
                  ];
                };

                ros-rolling = pkgs.rosPackages.rolling.buildEnv {
                  name = "ros-rolling";
                  postBuild = self.lib.rosWrapperArgs "rolling" pkgs;
                  paths = lib.attrValues (lib.filterAttrs (n: _p: lib.hasPrefix "ros-rolling-" n) self'.packages) ++ [
                    pkgs.qt6.wrapQtAppsHook
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
                  colmpc
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

              // lib.mapAttrs' (n: lib.nameValuePair "ros-humble-${n}") {
                inherit (pkgs.rosPackages.humble)
                  # keep-sorted start
                  agimus-controller
                  agimus-controller-ros
                  agimus-demo-00-franka-controller
                  agimus-demo-01-lfc-alone
                  # agimus-demo-02-simple-pd-plus-tiago-pro TODO: tiago-pro
                  agimus-demo-02-simple-pd-plus
                  # agimus-demo-03-mpc-dummy-traj-tiago-pro TODO: tiago-pro
                  agimus-demo-03-mpc-dummy-traj
                  # agimus-demo-04-dual-arm-tiago-pro TODO: tiago-pro
                  agimus-demo-04-visual-servoing
                  agimus-demo-05-pick-and-place
                  agimus-demo-06-regrasp
                  # agimus-demo-07-deburring TODO: pytroller
                  agimus-demo-08-collision-avoidance
                  agimus-demos-common
                  agimus-demos-controllers
                  # agimus-demos TODO: tiago-pro
                  agimus-franka-bringup
                  agimus-franka-description
                  agimus-franka-example-controllers
                  agimus-franka-fr3-moveit-config
                  agimus-franka-gazebo-bringup
                  agimus-franka-gripper
                  agimus-franka-hardware
                  agimus-franka-ign-ros2-control
                  agimus-franka-msgs
                  agimus-franka-robot-state-broadcaster
                  agimus-franka-ros2
                  agimus-franka-semantic-components
                  agimus-integration-launch-testing
                  agimus-libfranka
                  agimus-libfranka-common
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
