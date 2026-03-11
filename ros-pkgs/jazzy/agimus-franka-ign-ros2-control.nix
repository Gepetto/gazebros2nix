{
  lib,
  buildRosPackage,
  fetchFromGitHub,

  # nativeBuildInputs
  ament-cmake,

  # buildInputs
  agimus-franka-hardware,
  agimus-libfranka,
  ament-index-cpp,
  controller-manager,
  gz-plugin2,
  gz-sim8,
  hardware-interface,
  kdl-parser,
  pluginlib,
  rclcpp,
  rclcpp-lifecycle,
  tf2-eigen,
  tf2-geometry-msgs,
  urdf,
  yaml-cpp-vendor,

  # propagatedBuildInputs

  # checkInputs
  ament-lint-common,
}:
buildRosPackage rec {
  pname = "ros-jazzy-agimus-franka-ign-ros2-control";
  version = "1.0.0";

  src = fetchFromGitHub {
    owner = "agimus-project";
    repo = "agimus-franka-ros2";
    rev = "be2d4c91d57c08889bfbeda037658f9bc25c149d";
    hash = "sha256-gFmqCvtZ8ICcQ3CPCWMFSr7m5Z6qSvxkDPtg99CBjLI=";
  };
  sourceRoot = "source/agimus_franka_gazebo/agimus_franka_ign_ros2_control";

  buildType = "ament_cmake";

  nativeBuildInputs = [
    ament-cmake
  ];
  buildInputs = [
    agimus-franka-hardware
    agimus-libfranka
    ament-index-cpp
    controller-manager
    gz-plugin2
    gz-sim8
    hardware-interface
    kdl-parser
    pluginlib
    rclcpp
    rclcpp-lifecycle
    tf2-eigen
    tf2-geometry-msgs
    urdf
    yaml-cpp-vendor
  ];
  propagatedBuildInputs = [
  ];
  checkInputs = [
    ament-lint-common
  ];

  doCheck = true;

  meta = {
    description = "fork of franka_ign_ros2_control for franka robots not maintained anymore by agimus_franka";
    license = with lib.licenses; [ asl20 ];
    homepage = "https://github.com/agimus-project/agimus-franka-ros2";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}
