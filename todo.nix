final: prev: {
  # keep-sorted start block=yes
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
        inherit (final) dartsim urdfdom-headers urdfdom;
        dart = final.dartsim;

        # fast and ugly way to compensate the fact that
        # this version package.xml have no deps info,
        # so we use latest version package.xml,
        # but that is the wrong qt version
        qt6 = final.qt5 // {
          qt5compat = final.qt5.qtquickcontrols2;
        };

        # keep-sorted start block=yes

        ign-common4 = fortress-prev.ign-common4.overrideAttrs (super: {
          patches = [
            (final.fetchpatch {
              url = "https://github.com/nim65s/gz-common/commit/4efc4456686229e58e7b5af15810d0dfaff3fc1d.patch?full_index=1";
              hash = "sha256-98JIk5VJq1nUk38kww2rhXTacsbsFzDvpqf+VHQksgA=";
            })
          ];
          propagatedBuildInputs = super.propagatedBuildInputs ++ [ final.freeimage ];
        });
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
        ign-rendering6 = fortress-prev.ign-rendering6.overrideAttrs (super: {
          propagatedBuildInputs = super.propagatedBuildInputs ++ [ final.freeimage ];
        });
        ign-tools1 = fortress-prev.ign-tools1.overrideAttrs {
          postPatch = ''
            substituteInPlace CMakeLists.txt --replace-fail \
              "cmake_minimum_required(VERSION 2.8.12 FATAL_ERROR)" \
              "cmake_minimum_required(VERSION 3.10 FATAL_ERROR)"
          '';
        };
        ign-transport11 = fortress-prev.ign-transport11.overrideAttrs {
          postFixup = ''
            substituteInPlace $out/lib/ruby/gz/cmdtransport11.rb --replace-fail \
              '"../../..//nix/store' \
              '"/nix/store'
          '';
        };
        # keep-sorted end
      }
    );

    harmonic = prev.gazebo.harmonic.overrideScope (
      _harmonic-final: harmonic-prev: {
        inherit (final) dartsim urdfdom-headers urdfdom;
        dart = final.dartsim;

        # keep-sorted start block=yes

        gz-common5 = harmonic-prev.gz-common5.overrideAttrs {
          patches = [
            (final.fetchpatch {
              url = "https://github.com/nim65s/gz-common/commit/d21c3dfce2bbe463f888ed0ede37c6d483b8a49f.patch?full_index=1";
              hash = "sha256-uWNzRcbEg8b7ApJ3jKQqMQSUSGFAyJ9U18dCPzDwJhI=";
            })
          ];
        };
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
        gz-plugin2 = harmonic-prev.gz-plugin2.overrideAttrs {
          postFixup = ''
            substituteInPlace $out/lib/ruby/gz/cmdplugin2.rb --replace-fail \
              '"../../..//nix/store' \
              '"/nix/store'
          '';
        };
        gz-rendering8 = harmonic-prev.gz-rendering8.overrideAttrs {
          patches = [
            (final.fetchpatch {
              url = "https://github.com/gazebosim/gz-rendering/commit/80b6a05e535cc818d6f8590bc86f6a823f35e471.patch?full_index=1";
              hash = "sha256-ekKz8p2YBLLakVijhGS6+e6x98Zl8kx4Hg3PRJDkM5M=";
            })
          ];
        };
        gz-transport13 = harmonic-prev.gz-transport13.overrideAttrs {
          postFixup = ''
            substituteInPlace $out/lib/ruby/gz/cmdtransport13.rb --replace-fail \
              '"../../..//nix/store' \
              '"/nix/store'
          '';
        };
        # keep-sorted end
      }
    );

    ionic = prev.gazebo.ionic.overrideScope (
      _ionic-final: ionic-prev: {
        inherit (final) dartsim urdfdom-headers urdfdom;
        dart = final.dartsim;

        # keep-sorted start block=yes

        gz-msgs11 = ionic-prev.gz-msgs11.overrideAttrs {
          postFixup = ''
            substituteInPlace $out/lib/ruby/gz/cmdmsgs11.rb --replace-fail \
              "'../../..//nix/store" \
              "'/nix/store"
          '';
        };
        gz-plugin3 = ionic-prev.gz-plugin3.overrideAttrs {
          postFixup = ''
            substituteInPlace $out/lib/ruby/gz/cmdplugin3.rb --replace-fail \
              '"../../..//nix/store' \
              '"/nix/store'
          '';
        };
        gz-sdformat15 = ionic-prev.gz-sdformat15.overrideAttrs {
          postFixup = ''
            substituteInPlace $out/lib/ruby/gz/cmdsdformat15.rb --replace-fail \
              '"../../..//nix/store' \
              '"/nix/store'
          '';
        };
        gz-sim9 = ionic-prev.gz-sim9.overrideAttrs {
          postFixup = ''
            substituteInPlace $out/lib/ruby/gz/cmdmodel9.rb --replace-fail \
              '"../../..//nix/store' \
              '"/nix/store'
          '';
        };
        # keep-sorted end
      }
    );

    jetty = prev.gazebo.jetty.overrideScope (
      _jetty-final: jetty-prev: {
        inherit (final) dartsim urdfdom-headers urdfdom;
        dart = final.dartsim;

        # keep-sorted start block=yes

        gz-msgs12 = jetty-prev.gz-msgs12.overrideAttrs {
          postFixup = ''
            substituteInPlace $out/lib/ruby/gz/cmdmsgs12.rb --replace-fail \
              "'../../..//nix/store" \
              "'/nix/store"
          '';
        };
        gz-plugin4 = jetty-prev.gz-plugin4.overrideAttrs {
          postFixup = ''
            substituteInPlace $out/lib/ruby/gz/cmdplugin4.rb --replace-fail \
              '"../../..//nix/store' \
              '"/nix/store'
          '';
        };
        gz-sdformat16 = jetty-prev.gz-sdformat16.overrideAttrs {
          postFixup = ''
            substituteInPlace $out/lib/ruby/gz/cmdsdformat16.rb --replace-fail \
              '"../../..//nix/store' \
              '"/nix/store'
          '';
        };
        gz-sim10 = jetty-prev.gz-sim10.overrideAttrs (super: {
          postPatch = (super.postPatch or "") + ''
            substituteInPlace src/cmd/CMakeLists.txt \
              --replace-fail "$<TARGET_FILE_NAME:$""{model_executable}>" "$""{model_executable}" \
              --replace-fail "$<TARGET_FILE_NAME:$""{sim_executable}>" "$""{sim_executable}" \
              --replace-fail "$<TARGET_FILE_NAME:$""{gui_executable}>" "$""{gui_executable}" \
              --replace-fail "$""{CMAKE_INSTALL_LIBEXECDIR}" "libexec"
          '';
        });
        gz-transport15 = jetty-prev.gz-transport15.overrideAttrs {
          postFixup = ''
            substituteInPlace $out/lib/ruby/gz/cmd{transport,log}15.rb --replace-fail \
              '../../..//nix/store' \
              '/nix/store'
          '';
        };
        # keep-sorted end
      }
    );
  };

  rosPackages =
    let
      # some packages need an installed verison of themself discoverable by ament.
      # maybe we could use build dir.
      amentInstallCheckOverride = {
        checkTarget = " ";
        doInstallCheck = true;
        preInstallCheck = "export AMENT_PREFIX_PATH=$out:$AMENT_PREFIX_PATH";
        installCheckTarget = "test";
      };

      rosOverlay = ros-final: ros-prev: {
        inherit (final)
          dartsim
          fcl
          urdfdom-headers
          urdfdom
          octomap
          ;
        inherit (final.python3Packages)
          colmpc
          mim-solvers
          ;
        # keep-sorted start block=yes
        agimus-controller-ros = ros-prev.agimus-controller-ros.overrideAttrs {
          # this thing believe we did pass --build-directory or --build-base:
          # https://github.com/PickNikRobotics/generate_parameter_library/blob/main/generate_parameter_library_py/generate_parameter_library_py/setup_helper.py
          postPatch = ''
            substituteInPlace setup.py \
              --replace-fail \
                "from generate_parameter_library_py.setup_helper import generate_parameter_module" \
                "from generate_parameter_library_py.generate_python_module import run" \
              --replace-fail \
                "generate_parameter_module(module_name, yaml_file)" \
                "run(f\"$out/${ros-final.python3.sitePackages}/agimus_controller_ros/{module_name}.py\", yaml_file)"
          '';
        };
        agimus-demos = ros-prev.agimus-demos.overrideAttrs (super: {
          nativeBuildInputs = (super.nativeBuildInputs or [ ]) ++ [
            ros-final.ament-cmake
            final.cmake
            final.python3
          ];
        });
        agimus-franka-description = ros-prev.agimus-franka-description.overrideAttrs amentInstallCheckOverride;
        agimus-franka-example-controllers = ros-prev.agimus-franka-example-controllers.overrideAttrs amentInstallCheckOverride;
        agimus-franka-fr3-moveit-config = ros-prev.agimus-franka-fr3-moveit-config.overrideAttrs amentInstallCheckOverride;
        agimus-franka-msgs = ros-prev.agimus-franka-msgs.overrideAttrs {
          cmakeFlags = [
            "-DCMAKE_SKIP_BUILD_RPATH=ON"
            "-DCMAKE_BUILD_WITH_INSTALL_RPATH=ON"
          ];
        };
        agimus-franka-robot-state-broadcaster =
          ros-prev.agimus-franka-robot-state-broadcaster.overrideAttrs
            (super: {
              nativeBuildInputs = super.nativeBuildInputs ++ [ final.ctestCheckHook ];
              disabledTests = [ "test_load_agimus_franka_robot_state_broadcaster" ]; # TODO: ???
            });
        agimus-franka-semantic-components = ros-prev.agimus-franka-semantic-components.overrideAttrs amentInstallCheckOverride;
        agimus-msgs = ros-prev.agimus-msgs.overrideAttrs {
          cmakeFlags = [
            "-DCMAKE_SKIP_BUILD_RPATH=ON"
            "-DCMAKE_BUILD_WITH_INSTALL_RPATH=ON"
          ];
        };
        linear-feedback-controller = ros-prev.linear-feedback-controller.overrideAttrs {
          preCheck = ''
            export LD_LIBRARY_PATH=.
          '';
        };
        linear-feedback-controller-msgs = ros-prev.linear-feedback-controller-msgs.overrideAttrs {
          cmakeFlags = [
            "-DCMAKE_SKIP_BUILD_RPATH=ON"
            "-DCMAKE_BUILD_WITH_INSTALL_RPATH=ON"
          ];
        };
        # keep-sorted end
      };
    in
    prev.rosPackages
    // {
      humble = prev.rosPackages.humble.overrideScope (
        humble-final: humble-prev:
        (rosOverlay humble-final humble-prev)
        // {
          gazebo_11 = null;
          gazebo-planar-move-plugin = null;
          gazebo-ros = null;
          gazebo-dev = null;

          # keep-sorted start block=yes

          _unresolved_ignition-gazebo6 = humble-final.ignition-gazebo6;
          _unresolved_ignition-plugin = humble-final.ignition-plugin;
          agimus-franka-ign-ros2-control = humble-prev.agimus-franka-ign-ros2-control.overrideAttrs {
            env.ROS_DISTRO = "humble";
            env.IGNITION_VERSION = "fortress";
          };
          geometric-shapes = humble-prev.geometric-shapes.overrideAttrs {
            postPatch = ''
              substituteInPlace CMakeLists.txt --replace-fail \
                "find_package(octomap 1.9.7...<1.10.0 REQUIRED)" \
                "find_package(octomap REQUIRED)"
            '';
          };
          # that repo somehow has a 0.0.0 tag
          net-ft-description = humble-prev.net-ft-description.overrideAttrs (super: {
            src = final.fetchFromGitHub {
              inherit (super.src) repo;
              owner = "nim65s"; # ref https://github.com/gbartyzel/ros2_net_ft_driver/pull/26
              rev = "042b7885a7d1ca01f0adb153859fd7c6ace6ed41";
              hash = "sha256-A+A9c1N/2QShCk9z65PbBT4KvM4C+85X1Suai5bGGWM=";
            };
          });
          net-ft-diagnostic-broadcaster = humble-prev.net-ft-diagnostic-broadcaster.overrideAttrs {
            src = humble-final.net-ft-description.src;
          };
          net-ft-driver = humble-prev.net-ft-driver.overrideAttrs {
            src = humble-final.net-ft-description.src;
          };
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
          ros-gz-sim = humble-prev.ros-gz-sim.overrideAttrs (super: {
            propagatedNativeBuildInputs = (super.propagatedNativeBuildInputs or [ ]) ++ [
              humble-final.gz-tools
            ];
          });
          ros-gz-sim-demos = null; # wants qt-gui-cpp, where qt5 and python 3.13 are not compatible
          sdformat-urdf = humble-prev.sdformat-urdf.overrideAttrs {
            # ref. https://github.com/ros/sdformat_urdf/pull/41
            postPatch = ''
              substituteInPlace CMakeLists.txt --replace-fail \
                "find_package(urdfdom_headers 1.0.6 REQUIRED)" \
                "find_package(urdfdom_headers REQUIRED)"
            '';
          };
          topic-tools-interfaces = humble-prev.topic-tools-interfaces.overrideAttrs {
            doCheck = false;
          };
          # keep-sorted end
        }
      );

      jazzy = prev.rosPackages.jazzy.overrideScope (
        jazzy-final: jazzy-prev:
        (rosOverlay jazzy-final jazzy-prev)
        // {

          # keep-sorted start block=yes

          agimus-franka-hardware = jazzy-prev.agimus-franka-hardware.overrideAttrs {
            doCheck = false; # TODO
          };
          br2-gazebo-worlds = jazzy-prev.br2-gazebo-worlds.overrideAttrs {
            patches = [
              (final.fetchpatch {
                url = "https://github.com/nim65s/br2_gazebo_worlds/commit/8a2bf334bc3b286ed4187fe9ffcd723113794d0b.patch?full_index=1";
                hash = "sha256-1j2RgxBOXYitRXeVJt3MJQXGq6H70GgvBB6Cu40/63M=";
              })
            ];
          };
          # TODO: does not seem useful for now, but might bite later
          gazebo-planar-move-plugin = null;
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
          gz-sensors-vendor = jazzy-final.gz-sensors;
          gz-sim-vendor = jazzy-final.gz-sim;
          gz-tools-vendor = jazzy-final.gz-tools;
          gz-transport-vendor = jazzy-final.gz-transport;
          gz-utils-vendor = jazzy-final.gz-utils;
          moveit-task-constructor-core = jazzy-prev.moveit-task-constructor-core.overrideAttrs (super: {
            # TODO: unvendor pybind11 upstream
            cmakeFlags = (super.cmakeFlags or [ ]) ++ [ "-DPYBIND11_INSTALL=OFF" ];
          });
          net-ft-description = jazzy-prev.net-ft-description.overrideAttrs (super: {
            src = final.fetchFromGitHub {
              inherit (super.src) repo;
              owner = "nim65s"; # ref https://github.com/gbartyzel/ros1_net_ft_driver/pull/26
              rev = "a2770efe5d4ec3560fd35b4672a3b59d15c37d30";
              hash = "sha256-9kjfo4We1OQLgi5g9cMz3ync1vp4HiJPbE1NnQqA96A=";
            };
          });
          net-ft-diagnostic-broadcaster = jazzy-prev.net-ft-diagnostic-broadcaster.overrideAttrs {
            src = jazzy-final.net-ft-description.src;
          };
          net-ft-driver = jazzy-prev.net-ft-driver.overrideAttrs {
            src = jazzy-final.net-ft-description.src;
          };
          pal-gazebo-plugins = null;
          pal-gazebo-worlds = null;
          pal-maps = null;
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
                  "find_package(sdformat14 REQUIRED)"

              # ref. https://github.com/ros/sdformat_urdf/pull/42
              substituteInPlace CMakeLists.txt --replace-fail \
                "find_package(urdfdom_headers 1.0.6 REQUIRED)" \
                "find_package(urdfdom_headers REQUIRED)"
            '';
          };
          sdformat-vendor = jazzy-final.sdformat;
          tiago-pro-2dnav = null;
          tiago-pro-laser-sensors = null;
          tiago-pro-rgbd-sensors = null;
          urdf-test = null;
          # keep-sorted end
        }
      );

      kilted = prev.rosPackages.kilted.overrideScope (
        kilted-final: kilted-prev:
        (rosOverlay kilted-final kilted-prev)
        // {
          sdformat-urdf = kilted-prev.sdformat-urdf.overrideAttrs {
            postPatch = ''
              substituteInPlace CMakeLists.txt --replace-fail \
                "find_package(urdfdom_headers 1.0.6 REQUIRED)" \
                "find_package(urdfdom_headers REQUIRED)"
            '';
          };
        }
      );

      rolling = prev.rosPackages.rolling.overrideScope (
        rolling-final: rolling-prev: (rosOverlay rolling-final rolling-prev)
      );
    };
}
