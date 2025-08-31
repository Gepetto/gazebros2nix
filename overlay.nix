{
}:
(
  final: prev:
  {
    # keep-sorted start block=yes
    # boost = prev.boost186; # Thanks gazebo 11 :(
    # gazebo_11 = prev.gazebo_11.overrideAttrs (rec {
    #   # 11.14.0 does not compile
    #   version = "11.15.1";
    #   src = final.fetchFromGitHub {
    #     owner = "gazebosim";
    #     repo = "gazebo-classic";
    #     tag = "gazebo11_${version}";
    #     hash = "sha256-EieBsedwxelKY9LfFUzxuO189OvziSNXoKX2hYDoxMQ=";
    #   };
    # });
    # keep-sorted end
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
      noetic = prev.rosPackages.noetic.overrideScope (
        _noetic-final: noetic-prev: {
          # https://github.com/lopsided98/nix-ros-overlay/blob/develop/distros/noetic/overrides.nix#L206
          # has https://github.com/ros/rosconsole/pull/58.patch
          # but github somehow raises HTTP 429
          rosconsole = noetic-prev.rosconsole.overrideAttrs {
            patches = [ ./patches/ros/rosconsole/58_compatibility-fix-for-liblog4cxx-v011-013.patch ];
          };
          # drop fixed patch
          # ref. https://github.com/lopsided98/nix-ros-overlay/pull/636
          rosgraph = noetic-prev.rosgraph.overrideAttrs {
            patches = [ ];
          };
        }
      );
      humble = prev.rosPackages.humble.overrideScope (
        humble-final: humble-prev:
        {
          inherit (prev.gazebo.fortress)
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
          gazebo-ros = humble-prev.gazebo-ros.overrideAttrs (super: {
            buildInputs = (super.buildInputs or [ ]) ++ [ final.qt5.qtbase ];
          });
          play-motion2-msgs = humble-prev.play-motion2-msgs.overrideAttrs (_super: rec {
            version = "1.6.1";
            src = final.fetchFromGitHub {
              owner = "pal-robotics";
              repo = "play_motion2";
              tag = version;
              hash = "sha256-gUlwPuMBpKftCj9lKLuqmXAOFAFQocWmLdgwazUz2ls=";
            };
            sourceRoot = "source/play_motion2_msgs";
          });
          play-motion2 = humble-prev.play-motion2.overrideAttrs (super: rec {
            version = "1.6.1";
            src = final.fetchFromGitHub {
              owner = "pal-robotics";
              repo = "play_motion2";
              tag = version;
              hash = "sha256-gUlwPuMBpKftCj9lKLuqmXAOFAFQocWmLdgwazUz2ls=";
            };
            sourceRoot = "source/play_motion2";
            # fix for rclcpp < 17.1.0 (#2018). we currently have 16.0.12.
            postPatch =
              (super.postPatch or "")
              + ''
                sed -i "1i #include <functional>" src/utils/motion_loader.*
              '';
          });
          python-with-ament-package =
            let
              # TODO: this make no sense
              python = humble-final.python3.withPackages (p: [
                humble-final.ament-package
                p.catkin-pkg
              ]);
            in
            "${python}/${python.sitePackages}";
          ros-gz = humble-prev.ros-gz.overrideAttrs (_super: {
            env.PYTHONPATH = humble-final.python-with-ament-package;
            meta.platforms = final.lib.platforms.linux;
          });
          topic-tools-interfaces = humble-prev.topic-tools-interfaces.overrideAttrs {
            doCheck = false;
          };
        }
        // final.lib.filesystem.packagesFromDirectoryRecursive {
          inherit (humble-final) callPackage;
          directory = ./ros-pkgs/humble;
        }
      );
      jazzy = prev.rosPackages.jazzy.overrideScope (
        jazzy-final: _jazzy-prev:
        {
          inherit (prev.gazebo.harmonic)
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
        // final.lib.filesystem.packagesFromDirectoryRecursive {
          inherit (jazzy-final) callPackage;
          directory = ./ros-pkgs/jazzy;
        }
      );
    };
  }
  // prev.lib.filesystem.packagesFromDirectoryRecursive {
    inherit (final) callPackage;
    directory = ./pkgs;
  }
)
