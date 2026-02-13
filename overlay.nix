{
}:
(
  final: prev:
  {
    # keep-sorted start block=yes
    freeimage = final.callPackage ./garbage/freeimage/package.nix { };
    libjpeg_turbo-freeimage = final.callPackage ./garbage/libjpeg_turbo-freeimage/package.nix { };
    zenoh-c = prev.zenoh-c.overrideAttrs (super: {
      postInstall = super.postInstall + ''
        substituteInPlace $out/lib/cmake/zenohc/zenohcConfig.cmake --replace-fail \
          "$""{PACKAGE_PREFIX_DIR}/lib" \
          "$out/lib" \
      '';
    });
    zenoh-cpp = prev.zenoh-cpp.overrideAttrs (super: {
      postInstall = super.postInstall + ''
        substituteInPlace $out/lib/cmake/zenohcxx/zenohcxxConfig.cmake --replace-fail \
          "$""{_IMPORT_PREFIX}//nix/store" \
          "/nix/store"
      '';
    });
    # keep-sorted end

    # qt6 = prev.qt6.overrideScope (
    #   qt6-final: _qt6-prev: {
    #     qtquickcontrols = qt6-final.qtdeclarative; # TODO
    #   }
    # );

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

          ign-gazebo6 = fortress-prev.ign-gazebo6.overrideAttrs {
            postPatch = ''
              substituteInPlace src/systems/log/LogRecord.cc \
                --replace-fail "this->sdfMsg.GetTypeName()" "std::string(this->sdfMsg.GetTypeName())"
              substituteInPlace src/systems/triggered_publisher/TriggeredPublisher.cc \
                --replace-fail "info.msgData->GetTypeName()" "std::string(info.msgData->GetTypeName())"
            '';
          };

          ign-gui6 = fortress-prev.ign-gui6.overrideAttrs {
            postPatch = ''
              substituteInPlace src/plugins/topic_viewer/TopicViewer.cc \
                --replace-fail "msgField->name()" "std::string(msgField->name())" \
                --replace-fail "messageType->name()" "std::string(messageType->name())" \
                --replace-fail "msgField->type_name()" "std::string(msgField->type_name())"
            '';
          };

          ign-launch5 = fortress-prev.ign-launch5.overrideAttrs {
            postPatch = ''
              substituteInPlace plugins/websocket_server/WebsocketServer.cc \
                --replace-fail '((_op)+","+(_topic)+","+(_type)+",")' '((_op)+","+(_topic)+","+(std::string(_type))+",")'
            '';
          };

          ign-msgs8 = fortress-prev.ign-msgs8.overrideAttrs {
            postPatch = ''
              substituteInPlace src/Generator.cc \
                --replace-fail '"typedef std::unique_ptr<"' 'std::string("typedef std::unique_ptr<")' \
                --replace-fail '"typedef std::unique_ptr<const "' 'std::string("typedef std::unique_ptr<const ")' \
                --replace-fail '"typedef std::shared_ptr<"' 'std::string("typedef std::shared_ptr<")' \
                --replace-fail '_file->message_type(i)->name()' 'std::string(_file->message_type(i)->name())' \
                --replace-fail '_file->name()' 'std::string(_file->name())'
            '';
          };
        }
      );

      harmonic = prev.gazebo.harmonic.overrideScope (
        _harmonic-final: harmonic-prev: {
          dart = final.dartsim;

          gz-gui8 = harmonic-prev.gz-gui8.overrideAttrs {
            postPatch = ''
              substituteInPlace src/plugins/topic_viewer/TopicViewer.cc \
                --replace-fail "msgField->name()" "std::string(msgField->name())" \
                --replace-fail "messageType->full_name()" "std::string(messageType->full_name())" \
                --replace-fail "msgField->type_name()" "std::string(msgField->type_name())"
            '';
          };

          gz-launch7 = harmonic-prev.gz-launch7.overrideAttrs {
            postPatch = ''
              substituteInPlace plugins/websocket_server/WebsocketServer.cc \
                --replace-fail '((_op)+","+(_topic)+","+(_type)+",")' '((_op)+","+(_topic)+","+(std::string(_type))+",")'
            '';
          };

          gz-msgs10 = harmonic-prev.gz-msgs10.overrideAttrs {
            postPatch = ''
              substituteInPlace core/generator/Generator.cc \
                --replace-fail '"typedef std::unique_ptr<"' 'std::string("typedef std::unique_ptr<")' \
                --replace-fail '"typedef std::unique_ptr<const "' 'std::string("typedef std::unique_ptr<const ")' \
                --replace-fail '"typedef std::shared_ptr<"' 'std::string("typedef std::shared_ptr<")' \
                --replace-fail '+ desc->name() +' '+ std::string(desc->name()) +' \
                --replace-fail 'getNamespaces(_file->package())' 'getNamespaces(std::string(_file->package()))'
            '';
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
      # noetic = prev.rosPackages.noetic.overrideScope (
      #   _noetic-final: noetic-prev: {
      #     # https://github.com/lopsided98/nix-ros-overlay/blob/develop/distros/noetic/overrides.nix#L206
      #     # has https://github.com/ros/rosconsole/pull/58.patch
      #     # but github somehow raises HTTP 429
      #     rosconsole = noetic-prev.rosconsole.overrideAttrs {
      #       patches = [ ./patches/ros/rosconsole/58_compatibility-fix-for-liblog4cxx-v011-013.patch ];
      #     };
      #     # drop fixed patch
      #     # ref. https://github.com/lopsided98/nix-ros-overlay/pull/636
      #     rosgraph = noetic-prev.rosgraph.overrideAttrs {
      #       patches = [ ];
      #     };
      #   }
      # );

      humble = prev.rosPackages.humble.overrideScope (
        humble-final: humble-prev: {
          inherit (humble-final.python3Packages) coal colmpc mim-solvers;

          agimus-demos = humble-prev.agimus-demos.overrideAttrs (super: {
            # Those are behind a "$PAL_DISTRO == alum" condition
            propagatedBuildInputs = super.propagatedBuildInputs ++ [
              humble-final.agimus-demo-02-simple-pd-plus-tiago-pro
              humble-final.agimus-demo-03-mpc-dummy-traj-tiago-pro
            ];
          });

          agimus-demos-common = humble-prev.agimus-demos-common.overrideAttrs (super: {
            # Those are behind a "$PAL_DISTRO == alum" condition
            propagatedBuildInputs = super.propagatedBuildInputs ++ [
              humble-final.tiago-pro-description
              humble-final.tiago-pro-gazebo
            ];
          });

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

          agimus-libfranka = humble-prev.agimus-libfranka.overrideAttrs (super: {
            src = final.fetchFromGitHub {
              inherit (super.src) owner repo rev;
              fetchSubmodules = true;
              hash = "sha256-d/GG+yu96paIWYYoXK3w8EtdX70lcOFyZnWvVHUnVPw=";
            };
          });

          # EOL January 2025
          gazebo_11 = null;
          gazebo-dev = null;
          gazebo-ros = null;
          gazebo-ros2-control = null;
          gazebo-planar-move-plugin = null;
          gazebo-plugins = null;

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

          moveit-task-constructor-core = humble-prev.moveit-task-constructor-core.overrideAttrs (super: {
            # TODO: unvendor pybind11 upstream
            cmakeFlags = (super.cmakeFlags or [ ]) ++ [ "-DPYBIND11_INSTALL=OFF" ];
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

          pal-gazebo-plugins = null; # gazebo classic

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
