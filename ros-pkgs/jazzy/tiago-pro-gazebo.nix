{
  lib,
  buildRosPackage,
  fetchFromGitHub,

  # nativeBuildInputs
  ament-cmake-auto,

  # buildInputs

  # propagatedBuildInputs
  gz-plugin-vendor,
  gz-ros2-control,
  launch,
  launch-pal,
  launch-ros,
  omni-base-description,
  pal-gazebo-plugins,
  pal-gazebo-worlds,
  pal-maps,
  pal-pro-gripper-description,
  pal-urdf-utils,
  play-motion2-msgs,
  ros-gz-sim,
  tiago-pro-2dnav,
  tiago-pro-bringup,
  tiago-pro-description,
  tiago-pro-head-description,
  tiago-pro-laser-sensors,
  tiago-pro-moveit-config,
  tiago-pro-rgbd-sensors,

  # checkInputs
  ament-lint-auto,
  ament-lint-common,

  # nativeCheckInputs
}:
buildRosPackage rec {
  pname = "ros-jazzy-tiago-pro-gazebo";
  version = "1.14.1";

  src = fetchFromGitHub {
    owner = "Tiago-Pro-Harmonic";
    repo = "tiago_pro_simulation";
    rev = "0b0bcf5cb8cf3ca91a76a75856da58f43284786e";
    hash = "sha256-yEc5BrIPcu08v66up0d0PN7M0PWygHyie5h9j4YqQXk=";
  };
  sourceRoot = "source/tiago_pro_gazebo";

  __structuredAttrs = true;
  strictDeps = true;

  buildType = "ament_cmake";

  nativeBuildInputs = [
    ament-cmake-auto
  ];
  buildInputs = [
    ament-cmake-auto
  ];
  propagatedBuildInputs = [
    gz-plugin-vendor
    gz-ros2-control
    launch
    launch-pal
    launch-ros
    omni-base-description
    pal-gazebo-plugins
    pal-gazebo-worlds
    pal-maps
    pal-pro-gripper-description
    pal-urdf-utils
    play-motion2-msgs
    ros-gz-sim
    tiago-pro-2dnav
    tiago-pro-bringup
    tiago-pro-description
    tiago-pro-head-description
    tiago-pro-laser-sensors
    tiago-pro-moveit-config
    tiago-pro-rgbd-sensors
  ];
  checkInputs = [
    ament-lint-auto
    ament-lint-common
  ];
  nativeCheckInputs = [
  ];

  doCheck = false;

  meta = {
    description = "The tiago_pro_gazebo package";
    license = with lib.licenses; [ asl20 ];
    homepage = "https://github.com/Tiago-Pro-Harmonic/tiago_pro_simulation";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}
