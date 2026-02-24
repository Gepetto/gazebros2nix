{
}:
(
  final: prev:
  {
    # keep-sorted start block=yes
    freeimage = final.callPackage ./garbage/freeimage/package.nix { };
    libjpeg_turbo-freeimage = final.callPackage ./garbage/libjpeg_turbo-freeimage/package.nix { };
    zenoh-c = prev.zenoh-c.overrideAttrs (super: {
      # TODO: port https://github.com/eclipse-zenoh/zenoh-cpp/pull/702
      postInstall = super.postInstall + ''
        substituteInPlace $out/lib/cmake/zenohc/zenohcConfig.cmake --replace-fail \
          "$""{PACKAGE_PREFIX_DIR}/lib" \
          "$out/lib" \
      '';
    });
    zenoh-cpp = prev.zenoh-cpp.overrideAttrs (super: {
      # ref. https://github.com/eclipse-zenoh/zenoh-cpp/pull/702
      postInstall = super.postInstall + ''
        substituteInPlace $out/lib/cmake/zenohcxx/zenohcxxConfig.cmake --replace-fail \
          "$""{_IMPORT_PREFIX}//nix/store" \
          "/nix/store"
      '';
    });
    # keep-sorted end

    gazebo = prev.gazebo // {
      fortress = prev.gazebo.fortress.overrideScope (
        _fortress-final: fortress-prev: {
          dart = final.dartsim;

          # fast and ugly way to compensate the fact that
          # this version package.xml have no deps info,
          # so we use latest version package.xml,
          # but that is the wrong qt version
          qt6 = final.qt5 // {
            qt5compat = final.qt5.qtquickcontrols2;
          };

          ign-gui6 = fortress-prev.ign-gui6.overrideAttrs {
            patches = [
              (final.fetchpatch2 {
                url = "https://github.com/gazebosim/gz-gui/pull/696.patch?full_index=1";
                hash = "sha256-MCAkRp7unMx9r2WZnR4vbUpJAeU6Bpku2E7IyAmLoIM=";
              })
            ];
          };

          ign-launch5 = fortress-prev.ign-launch5.overrideAttrs {
            # TODO: not sure why it was missed in https://github.com/gazebosim/gz-launch/pull/299
            postPatch = ''
              substituteInPlace plugins/websocket_server/WebsocketServer.cc \
                --replace-fail '((_op)+","+(_topic)+","+(_type)+",")' '((_op)+","+(_topic)+","+(std::string(_type))+",")'
            '';
          };
        }
      );

      harmonic = prev.gazebo.harmonic.overrideScope (
        _harmonic-final: harmonic-prev: {
          dart = final.dartsim;

          gz-gui8 = harmonic-prev.gz-gui8.overrideAttrs {
            patches = [
              (final.fetchpatch2 {
                url = "https://github.com/gazebosim/gz-gui/pull/677.patch?full_index=1";
                hash = "sha256-JQgHaNAOv36K4c+i+Fn5+ZRb0LK9E7UExm2SKBYKKFo=";
              })
              (final.fetchpatch2 {
                url = "https://github.com/gazebosim/gz-gui/pull/745.patch?full_index=1";
                hash = "sha256-38zgigMiHdTYHrcbvd6sc+pt+qQPpZHrcQc8aSSZcP4=";
              })
            ];
          };

          gz-launch7 = harmonic-prev.gz-launch7.overrideAttrs {
            # TODO: not sure why it was missed in https://github.com/gazebosim/gz-launch/pull/299
            postPatch = ''
              substituteInPlace plugins/websocket_server/WebsocketServer.cc \
                --replace-fail '((_op)+","+(_topic)+","+(_type)+",")' '((_op)+","+(_topic)+","+(std::string(_type))+",")'
            '';
          };

          gz-msgs10 = harmonic-prev.gz-msgs10.overrideAttrs {
            patches = [
              (final.fetchpatch2 {
                url = "https://github.com/gazebosim/gz-msgs/pull/501.patch?full_index=1";
                hash = "sha256-0uscwyYZafHfzooxcrrhtcfcxknpDTEcZ6Ie0WWySVw=";
              })
            ];
          };
        }
      );

      ionic = prev.gazebo.ionic.overrideScope (
        _ionic-final: _ionic-prev: {
          dart = final.dartsim;
        }
      );

      jetty = prev.gazebo.jetty.overrideScope (
        _jetty-final: jetty-prev: {
          dart = final.dartsim;
          gz-sim10 = jetty-prev.gz-sim10.overrideAttrs (super: {
            postPatch = (super.postPatch or "") + ''
              substituteInPlace src/cmd/CMakeLists.txt \
                --replace-fail "$<TARGET_FILE_NAME:$""{model_executable}>" "$""{model_executable}" \
                --replace-fail "$<TARGET_FILE_NAME:$""{sim_executable}>" "$""{sim_executable}" \
                --replace-fail "$<TARGET_FILE_NAME:$""{gui_executable}>" "$""{gui_executable}" \
                --replace-fail "$""{CMAKE_INSTALL_LIBEXECDIR}" "libexec"
            '';
          });
        }
      );
    };

    rosPackages = prev.rosPackages // {
      humble = prev.rosPackages.humble.overrideScope (
        humble-final: humble-prev: {
          inherit (humble-final.python3Packages) coal colmpc mim-solvers;

          gazebo_11 = null;
          gazebo-planar-move-plugin = null;
          gazebo-ros = null;
          gazebo-dev = null;

          agimus-controller-ros = humble-prev.agimus-controller-ros.overrideAttrs {
            # this thing believe we did pass --build-directory or --build-base:
            # https://github.com/PickNikRobotics/generate_parameter_library/blob/main/generate_parameter_library_py/generate_parameter_library_py/setup_helper.py
            postPatch = ''
              substituteInPlace setup.py \
                --replace-fail \
                  "from generate_parameter_library_py.setup_helper import generate_parameter_module" \
                  "from generate_parameter_library_py.generate_python_module import run" \
                --replace-fail \
                  "generate_parameter_module(module_name, yaml_file)" \
                  "run(f\"$out/${humble-final.python3.sitePackages}/agimus_controller_ros/{module_name}.py\", yaml_file)"
            '';
          };

          # franka-ros2 wrong keys, should be fixed in agimus-franka-ros2
          ignition-gazebo6 = humble-prev.ign-gazebo6;
          ignition-plugin = humble-prev.ign-plugin1;

          linear-feedback-controller = humble-prev.linear-feedback-controller.overrideAttrs (super: {
            buildInputs = super.buildInputs ++ [
              humble-final.eigen3-cmake-module
              humble-final.tf2-eigen
            ];
            preCheck = ''
              export LD_LIBRARY_PATH=.
            '';
          });

          # that repo somehow has a 0.0.0 tag
          net-ft-description = humble-prev.net-ft-description.overrideAttrs (super: {
            src = final.fetchFromGitHub {
              inherit (super.src) owner repo;
              rev = "393960c20c1607bbdeec7bff70ce5b4db01e3ab3";
              hash = "sha256-ZBIGq/3FHcDgRnOfp1h5ABtj4e7KyqSIx+n6WpgB0qI=";
            };
          });
          net-ft-diagnostic-broadcaster = humble-prev.net-ft-diagnostic-broadcaster.overrideAttrs {
            src = humble-final.net-ft-description.src;
          };
          net-ft-driver = humble-prev.net-ft-driver.overrideAttrs {
            src = humble-final.net-ft-description.src;
          };

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
            postPatch = (super.postPatch or "") + ''
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

          ros-gz-sim-demos = null; # wants qt-gui-cpp, where qt5 and python 3.13 are not compatible

          topic-tools-interfaces = humble-prev.topic-tools-interfaces.overrideAttrs {
            doCheck = false;
          };
        }
      );

      jazzy = prev.rosPackages.jazzy.overrideScope (
        jazzy-final: jazzy-prev: {
          linear-feedback-controller = jazzy-prev.linear-feedback-controller.overrideAttrs (super: {
            buildInputs = super.buildInputs ++ [
              jazzy-final.tf2-eigen
            ];
            preCheck = ''
              export LD_LIBRARY_PATH=.
            '';
          });

          # TODO: packages wanted by tiago-harmonic but I don't know where to find them
          tiago-launch = null;
          gazebo-planar-move-plugin = null;
          urdf-test = null;
          pal-gazebo-plugins = null;

          # typo ?
          gz-plugins-vendor = jazzy-final.gz-plugin;

          # unvendor
          gz-cmake-vendor = jazzy-final.gz-cmake;
          gz-common-vendor = jazzy-final.gz-common;
          gz-fuel-tools-vendor = jazzy-final.gz-fuel-tools;
          gz-gui-vendor = jazzy-final.gz-gui;
          gz-launch-vendor = jazzy-final.gz-launch;
          gz-math-vendor = jazzy-final.gz-math;
          gz-msgs-vendor = jazzy-final.gz-msgs;
          gz-physics-vendor = jazzy-final.gz-physics;
          gz-plugin-vendor = jazzy-final.gz-plugin;
          gz-rendering-vendor = jazzy-final.gz-rendering;
          gz-sensors-vendor = jazzy-final.gz-sensors;
          gz-sim-vendor = jazzy-final.gz-sim;
          gz-tools-vendor = jazzy-final.gz-tools;
          gz-transport-vendor = jazzy-final.gz-transport;
          gz-utils-vendor = jazzy-final.gz-utils;
          sdformat-vendor = jazzy-final.sdformat;

          gz-ros2-control = jazzy-prev.gz-ros2-control.overrideAttrs {
            postPatch = ''
              substituteInPlace CMakeLists.txt \
                --replace-fail "find_package(gz_sim_vendor REQUIRED)" "" \
                --replace-fail "find_package(gz_plugin_vendor REQUIRED)" "" \
                --replace-fail \
                  "find_package(gz-sim REQUIRED)" \
                  "find_package(gz-sim8 REQUIRED)" \
                --replace-fail \
                  "gz-sim::gz-sim" \
                  "gz-sim8::gz-sim8" \
                --replace-fail \
                  "find_package(gz-plugin REQUIRED)" \
                  "find_package(gz-plugin2 REQUIRED)" \
                --replace-fail \
                  "gz-plugin::register" \
                  "gz-plugin2::register" \

            '';
          };

          ros-gz-bridge = jazzy-prev.ros-gz-bridge.overrideAttrs {
            cmakeFlags = [
              "-DGZ_MSGS_VERSION_FULL=${jazzy-final.gz-msgs.version}"
            ];
            postPatch = ''
              substituteInPlace CMakeLists.txt \
                --replace-fail "find_package(gz_transport_vendor REQUIRED)" "" \
                --replace-fail "find_package(gz_msgs_vendor REQUIRED)" "" \
                --replace-fail "gz-transport::" "gz-transport13::" \
                --replace-fail "gz-msgs::" "gz-msgs10::" \
                --replace-fail \
                  "find_package(gz-transport REQUIRED)" \
                  "find_package(gz-transport13 REQUIRED)" \
                --replace-fail \
                  "find_package(gz-msgs REQUIRED)" \
                  "find_package(gz-msgs10 REQUIRED)" \
            '';
            postFixup = ''
              substituteInPlace \
                $out/share/ros_gz_bridge/cmake/ament_cmake_export_dependencies-extras.cmake \
                --replace-fail "gz_transport_vendor;" "" \
                --replace-fail "gz_msgs_vendor;" "" \
                --replace-fail "gz-transport;" "gz-transport13;" \
                --replace-fail "gz-msgs;" "gz-msgs10;" \
            '';
          };

          ros-gz-image = jazzy-prev.ros-gz-image.overrideAttrs {
            postPatch = ''
              substituteInPlace CMakeLists.txt \
                --replace-fail "find_package(gz_transport_vendor REQUIRED)" "" \
                --replace-fail "find_package(gz_msgs_vendor REQUIRED)" "" \
                --replace-fail "gz-transport::" "gz-transport13::" \
                --replace-fail "gz-msgs::" "gz-msgs10::" \
                --replace-fail \
                  "find_package(gz-transport REQUIRED)" \
                  "find_package(gz-transport13 REQUIRED)" \
                --replace-fail \
                  "find_package(gz-msgs REQUIRED)" \
                  "find_package(gz-msgs10 REQUIRED)" \
            '';
          };

          ros-gz-sim = jazzy-prev.ros-gz-sim.overrideAttrs (super: {
            cmakeFlags = [ "-DGZ_SIM_VER=${final.lib.versions.major jazzy-final.gz-sim.version}" ];
            postPatch = super.postPatch + ''
              substituteInPlace CMakeLists.txt \
                --replace-fail "find_package(gz_transport_vendor REQUIRED)" "" \
                --replace-fail "find_package(gz_msgs_vendor REQUIRED)" "" \
                --replace-fail "find_package(gz_math_vendor REQUIRED)" "" \
                --replace-fail "find_package(gz_sim_vendor REQUIRED)" "" \
                --replace-fail "gz-transport::" "gz-transport13::" \
                --replace-fail "gz-msgs::" "gz-msgs10::" \
                --replace-fail "gz-math::" "gz-math7::" \
                --replace-fail "gz-sim::" "gz-sim8::" \
                --replace-fail \
                  "find_package(gz-transport REQUIRED)" \
                  "find_package(gz-transport13 REQUIRED)" \
                --replace-fail \
                  "find_package(gz-msgs REQUIRED)" \
                  "find_package(gz-msgs10 REQUIRED)" \
                --replace-fail \
                  "find_package(gz-math REQUIRED)" \
                  "find_package(gz-math7 REQUIRED)" \
                --replace-fail \
                  "find_package(gz-sim REQUIRED)" \
                  "find_package(gz-sim8 REQUIRED)" \
            '';
          });

          rviz-default-plugins = jazzy-prev.rviz-default-plugins.overrideAttrs {
            postPatch = ''
              substituteInPlace CMakeLists.txt \
                --replace-fail "find_package(gz_math_vendor REQUIRED)" "" \
                --replace-fail "gz-math::" "gz-math7::" \
                --replace-fail \
                  "find_package(gz-math REQUIRED)" \
                  "find_package(gz-math7 REQUIRED)" \
            '';
          };
          sdformat-urdf = jazzy-prev.sdformat-urdf.overrideAttrs {
            postPatch = ''
              substituteInPlace CMakeLists.txt \
                --replace-fail "find_package(sdformat_vendor REQUIRED)" "" \
                --replace-fail "sdformat::" "sdformat14::" \
                --replace-fail \
                  "find_package(sdformat REQUIRED)" \
                  "find_package(sdformat14 REQUIRED)" \
            '';
          };
        }
      );

      kilted = prev.rosPackages.kilted.overrideScope (
        kilted-final: kilted-prev: {
          linear-feedback-controller = kilted-prev.linear-feedback-controller.overrideAttrs (super: {
            buildInputs = super.buildInputs ++ [
              kilted-final.tf2-eigen
            ];
            preCheck = ''
              export LD_LIBRARY_PATH=.
            '';
          });
        }
      );

      rolling = prev.rosPackages.rolling.overrideScope (
        rolling-final: rolling-prev: {
          linear-feedback-controller = rolling-prev.linear-feedback-controller.overrideAttrs (super: {
            buildInputs = super.buildInputs ++ [
              rolling-final.eigen3-cmake-module
              rolling-final.tf2-eigen
            ];
            postPatch = ''
              substituteInPlace CMakeLists.txt \
                --replace-warn \
                  "ament_target_dependencies($""{PROJECT_NAME} Eigen3)" \
                  "target_link_libraries($""{PROJECT_NAME} Eigen3::Eigen message_filters::message_filters)"
              substituteInPlace include/linear_feedback_controller/linear_feedback_controller_ros.hpp \
                --replace-warn \
                  "message_filters/subscriber.h" \
                  "message_filters/subscriber.hpp" \
                --replace-warn \
                  "message_filters/time_synchronizer.h" \
                  "message_filters/time_synchronizer.hpp"
              substituteInPlace src/joint_state_estimator.cpp \
                --replace-warn \
                  "state_ordered_interfaces_[i].get().get_value()" \
                  "state_ordered_interfaces_[i].get().get_optional().value()"
            '';
            preCheck = ''
              export LD_LIBRARY_PATH=.
            '';
          });
          linear-feedback-controller-msgs =
            rolling-prev.linear-feedback-controller-msgs.overrideAttrs
              (super: {
                cmakeFlags = (super.cmakeFlags or [ ]) ++ [
                  (final.lib.cmakeFeature "CMAKE_CTEST_ARGUMENTS" "--exclude-regex;'flake8_rosidl_generated_py'")
                ];
              });
        }
      );
    };
  }

  // prev.lib.filesystem.packagesFromDirectoryRecursive {
    inherit (final) callPackage;
    directory = ./pkgs;
  }
)
