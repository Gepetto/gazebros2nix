{
  inputs = {
    flakoboros.url = "github:gepetto/flakoboros";
    flake-parts.follows = "flakoboros/flake-parts";
    nix-ros-overlay.follows = "flakoboros/nix-ros-overlay";
    nixpkgs.follows = "flakoboros/nixpkgs";
    systems.follows = "flakoboros/systems";
    treefmt-nix.follows = "flakoboros/treefmt-nix";

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
        flakeModule = inputs.flake-parts.lib.importApply ./module.nix {
          inherit (inputs) nixpkgs nix-ros-overlay;
        };
      in
      {
        systems = import inputs.systems;
        imports = [
          flakeModule
          {
            flakoboros = {
              overlays = [
                (final: _prev: {
                  inherit (inputs) pyproject-build-systems pyproject-nix uv2nix;
                  pythonVersion = inputs.flakoboros.lib.pythonVersion final;
                })
              ];
              rosShellDistro = "humble";
              filterPackages =
                n: _v: ((!lib.hasPrefix "gz-" n) || lib.hasPrefix "gz-harmonic-" n) && (!lib.hasPrefix "ign-" n);
            };
          }
        ];
        flake = { inherit flakeModule; };
        perSystem =
          {
            pkgs,
            self',
            system,
            ...
          }:
          let
            rosShellHook = self.lib.rosShellHook pkgs;
            rosWrapperArgs = self.lib.rosWrapperArgs pkgs;
          in
          {
            devShells.default = pkgs.mkShell {
              packages = [
                pkgs.gazebros2nix-venv.passthru.editableVirtualenv
              ];
              shellHook = rosShellHook null + ''
                test -f .venv/bin/activate && source .venv/bin/activate
              '';
            };

            packages = lib.filterAttrs (_n: v: v.meta.available && !v.meta.broken) (
              {
                gz-fortress = pkgs.rosPackages.humble.buildEnv {
                  name = "gz-fortress";
                  postBuild = rosWrapperArgs "humble";
                  paths = lib.attrValues (lib.filterAttrs (n: _p: lib.hasPrefix "gz-fortress-" n) self'.packages) ++ [
                    pkgs.qt5.qtgraphicaleffects
                    pkgs.qt5.wrapQtAppsHook
                  ];
                };

                gz-harmonic = pkgs.rosPackages.jazzy.buildEnv {
                  name = "gz-harmonic";
                  postBuild = rosWrapperArgs "jazzy";
                  paths = lib.attrValues (lib.filterAttrs (n: _p: lib.hasPrefix "gz-harmonic-" n) self'.packages) ++ [
                    pkgs.qt5.wrapQtAppsHook
                  ];
                };

                gz-ionic = pkgs.rosPackages.kilted.buildEnv {
                  name = "gz-ionic";
                  postBuild = rosWrapperArgs "kilted";
                  paths = lib.attrValues (lib.filterAttrs (n: _p: lib.hasPrefix "gz-ionic-" n) self'.packages) ++ [
                    pkgs.qt5.wrapQtAppsHook
                  ];
                };

                gz-jetty = pkgs.rosPackages.rolling.buildEnv {
                  name = "gz-jetty";
                  postBuild = rosWrapperArgs "rolling";
                  paths = lib.attrValues (lib.filterAttrs (n: _p: lib.hasPrefix "gz-jetty-" n) self'.packages) ++ [
                    pkgs.qt6.wrapQtAppsHook
                  ];
                };

                ros-humble = pkgs.rosPackages.humble.buildEnv {
                  name = "ros-humble";
                  postBuild = rosWrapperArgs "humble";
                  paths = lib.attrValues (lib.filterAttrs (n: _p: lib.hasPrefix "ros-humble-" n) self'.packages) ++ [
                    pkgs.python3Packages.coal # TODO
                    pkgs.qt5.qtgraphicaleffects
                    pkgs.qt5.wrapQtAppsHook
                  ];
                };

                ros-jazzy = pkgs.rosPackages.jazzy.buildEnv {
                  name = "ros-jazzy";
                  postBuild = rosWrapperArgs "jazzy";
                  paths = lib.attrValues (lib.filterAttrs (n: _p: lib.hasPrefix "ros-jazzy-" n) self'.packages) ++ [
                    pkgs.python3Packages.coal # TODO
                    pkgs.qt5.wrapQtAppsHook
                  ];
                };

                ros-kilted = pkgs.rosPackages.kilted.buildEnv {
                  name = "ros-kilted";
                  postBuild = rosWrapperArgs "kilted";
                  paths = lib.attrValues (lib.filterAttrs (n: _p: lib.hasPrefix "ros-kilted-" n) self'.packages) ++ [
                    pkgs.qt5.wrapQtAppsHook
                  ];
                };

                ros-rolling = pkgs.rosPackages.rolling.buildEnv {
                  name = "ros-rolling";
                  postBuild = rosWrapperArgs "rolling";
                  paths = lib.attrValues (lib.filterAttrs (n: _p: lib.hasPrefix "ros-rolling-" n) self'.packages) ++ [
                    pkgs.qt6.wrapQtAppsHook
                  ];
                };
              }

              // {
                inherit (pkgs)
                  # keep-sorted start
                  freeimage
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
                  # ros2-control-demo-example-9 # need to fix gz-sim-vendor first
                  # ros2-control-demos # need the other ones
                  br2-gazebo-worlds
                  launch-pal
                  linear-feedback-controller
                  linear-feedback-controller-msgs
                  omni-base-bringup
                  omni-base-controller-configuration
                  omni-base-description
                  omni-base-robot
                  pal-pro-gripper
                  pal-pro-gripper-bringup
                  pal-pro-gripper-controller-configuration
                  pal-pro-gripper-description
                  pal-pro-gripper-wrapper
                  pal-sea-arm
                  pal-sea-arm-bringup
                  pal-sea-arm-controller-configuration
                  pal-sea-arm-description
                  pal-sea-arm-moveit-config
                  pal-urdf-utils
                  play-motion2
                  play-motion2-cli
                  play-motion2-msgs
                  ros-gz-bridge
                  ros-gz-image
                  ros2-control-demo-description
                  ros2-control-demo-example-1
                  ros2-control-demo-example-10
                  ros2-control-demo-example-11
                  # ros2-control-demo-example-12  # TODO generate_parameter_library_cpp_BIN
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
                  tiago-pro-bringup
                  tiago-pro-controller-configuration
                  tiago-pro-description
                  tiago-pro-gazebo
                  tiago-pro-head-bringup
                  tiago-pro-head-controller-configuration
                  tiago-pro-head-description
                  tiago-pro-head-robot
                  tiago-pro-lfc-bringup
                  tiago-pro-moveit-config
                  tiago-pro-robot
                  tiago-pro-simulation
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
