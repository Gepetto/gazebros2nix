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
              }
              // {
                inherit (pkgs)
                  # keep-sorted start
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
              // lib.mapAttrs' (n: lib.nameValuePair "ros-noetic-${n}") (
                lib.optionalAttrs (system == "x86_64-linux") {
                  inherit (pkgs.rosPackages.noetic)
                    # keep-sorted start
                    rosbag
                    rospy
                    # keep-sorted end
                    ;
                }
              )
              // lib.mapAttrs' (n: lib.nameValuePair "ros-humble-${n}") {
                inherit (pkgs.rosPackages.humble)
                  # keep-sorted start
                  tiago-pro-description
                  tiago-pro-gazebo
                  # keep-sorted end
                  ;
              }
              // lib.mapAttrs' (n: lib.nameValuePair "ros-jazzy-${n}") {
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
