final: prev: {
  rosPackages = prev.rosPackages // {
    # PAL alum: ROS humble but jazzy versions of ros control
    alum =
      let
        gzVendorOverlay =
          ros-final: ros-prev:
          final.lib.genAttrs'
            [
              "gz-cmake"
              "gz-common"
              "gz-dartsim"
              "gz-fuel-tools"
              "gz-gui"
              "gz-launch"
              "gz-math"
              "gz-msgs"
              "gz-physics"
              "gz-ogre-next"
              "gz-plugin"
              "gz-rendering"
              "gz-sensors"
              "gz-sim"
              "gz-tools"
              "gz-transport"
              "gz-utils"
              "sdformat"
            ]
            (
              pkg:
              final.lib.nameValuePair "${pkg}-vendor" (
                ros-prev."${pkg}-vendor".overrideAttrs (
                  {
                    # cmakeFlags ? [ ],
                    propagatedBuildInputs ? [ ],
                    ...
                  }:
                  {
                    # cmakeFlags = cmakeFlags ++ [ (final.lib.cmakeFeature "AMENT_VENDOR_POLICY" "NEVER_VENDOR") ];
                    cmakeFlags = [ (final.lib.cmakeFeature "AMENT_VENDOR_POLICY" "NEVER_VENDOR") ];
                    propagatedBuildInputs = propagatedBuildInputs ++ [ ros-final."${pkg}" ];
                  }
                )
              )
            );
      in

      (
        (prev.rosPackages.humble.overrideScope (
          alum-final: _humble-prev:
          final.lib.filesystem.packagesFromDirectoryRecursive {
            inherit (alum-final) callPackage;
            directory = ./ros-pkgs/alum;
          }
          // {
            inherit (final.gazeboPackages.harmonic)
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
        )).overrideScope
        (alum-final: alum-prev: (gzVendorOverlay alum-final alum-prev))
      ).overrideScope
        (
          alum-final: alum-prev: {
            inherit (final.rosPackages.jazzy) rosidl-pycommon;
            ros-gz-point-cloud = null;
            gz-ogre-next = final.libogre-next-23-dev;
            # keep-sorted start block=yes
            admittance-controller = alum-prev.admittance-controller.overrideAttrs (super: {
              buildInputs = super.buildInputs ++ [ alum-final.ros2-control-test-assets ];
            });
            control-msgs = alum-prev.control-msgs.overrideAttrs {
              cmakeFlags = [
                "-DCMAKE_SKIP_BUILD_RPATH=ON"
                "-DCMAKE_BUILD_WITH_INSTALL_RPATH=ON"
              ];
            };
            controller-manager-msgs = alum-prev.controller-manager-msgs.overrideAttrs {
              cmakeFlags = [
                "-DCMAKE_SKIP_BUILD_RPATH=ON"
                "-DCMAKE_BUILD_WITH_INSTALL_RPATH=ON"
              ];
            };
            gz-transport-vendor = alum-prev.gz-transport-vendor.overrideAttrs {
              postPatch = ''
                substituteInPlace CMakeLists.txt --replace-fail \
                  "$""{VERSION_MATCH} $""{LIB_VER}" ""
              '';
            };
            ros-gz-interfaces = alum-prev.ros-gz-interfaces.overrideAttrs {
              cmakeFlags = [
                "-DCMAKE_SKIP_BUILD_RPATH=ON"
                "-DCMAKE_BUILD_WITH_INSTALL_RPATH=ON"
              ];
            };
            ros-gz-bridge = alum-prev.ros-gz-bridge.overrideAttrs {
              postPatch = ''
                substituteInPlace src/bridge_config.cpp --replace-fail \
                  "rclcpp::BestAvailableQoS();" \
                  "rclcpp::SystemDefaultsQoS();"
              '';
              doCheck = false;
            };
            gz-dartsim-vendor = alum-prev.gz-dartsim-vendor.overrideAttrs {
              # env.GZ_RELAX_VERSION_MATCH = ""; TODO
              postPatch = ''
                substituteInPlace CMakeLists.txt --replace-fail \
                  "$""{VERSION_MATCH} $""{LIB_VER_MAJOR}.$""{LIB_VER_MINOR}" ""
              '';
            };

            ros-gz = alum-prev.ros-gz.overrideAttrs { doCheck = false; };
            ros-gz-sim = alum-prev.ros-gz-sim.overrideAttrs { doCheck = false; };
            ros-gz-sim-demos = alum-prev.ros-gz-sim-demos.overrideAttrs { doCheck = false; };
            gz-ogre-next-vendor = alum-prev.gz-ogre-next-vendor.overrideAttrs (super: {
              postPatch = ''
                substituteInPlace CMakeLists.txt --replace-fail \
                  "ament_vendor($""{PROJECT_NAME}" \
                  "ament_vendor($""{PROJECT_NAME}
                    SATISFIED TRUE"
              '';
            });
            gz-tools-vendor = alum-prev.gz-tools-vendor.overrideAttrs (super: {
              nativeBuildInputs = super.nativeBuildInputs ++ [ alum-final.gz-tools ];
            });
            kinematics-interface-kdl = alum-prev.kinematics-interface-kdl.overrideAttrs (super: {
              buildInputs = super.buildInputs ++ [ alum-final.ros2-control-test-assets ];
              doCheck = false;
            });
            sdformat-urdf = alum-prev.sdformat-urdf.overrideAttrs (super: {
              # ref. https://github.com/ros/sdformat_urdf/pull/41
              postPatch = ''
                substituteInPlace CMakeLists.txt --replace-fail \
                  "find_package(urdfdom_headers 1.0.6 REQUIRED)" \
                  "find_package(urdfdom_headers REQUIRED)"
              '';
              nativeCheckInputs = super.nativeCheckInputs ++ [ final.ctestCheckHook ];
              disabledTests = [ "uncrustify" ];
            });
            # keep-sorted end
          }
        );
  };
}
