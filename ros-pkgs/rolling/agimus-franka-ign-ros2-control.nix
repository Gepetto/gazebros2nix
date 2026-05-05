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

  # nativeCheckInputs
}:
buildRosPackage rec {
  pname = "ros-rolling-agimus-franka-ign-ros2-control";
  version = "1.0.0";

  src = fetchFromGitHub {
    owner = "agimus-project";
    repo = "agimus-franka-ros2";
    rev = "2719804b4ed7b2d4ef12d8ae4be34e0a5e1ac5cc";
    hash = "sha256-J5ebhKVkF3m/0RcRFXv+UTqLjRAQBhbpajrVsl+z1oo=";
  };
  sourceRoot = "source/agimus_franka_gazebo/agimus_franka_ign_ros2_control";

  __structuredAttrs = true;
  strictDeps = true;

  buildType = "ament_cmake";

  nativeBuildInputs = [
    ament-cmake
  ];
  buildInputs = [
    agimus-franka-hardware
    agimus-libfranka
    ament-cmake
    ament-index-cpp
    controller-manager
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
    agimus-franka-hardware
    agimus-libfranka
    ament-index-cpp
    controller-manager
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
  checkInputs = [
    ament-lint-common
  ];
  nativeCheckInputs = [
  ];

  doCheck = true;

  meta = {
    description = "fork of franka_ign_ros2_control for franka robots not maintained anymore by franka";
    license = with lib.licenses; [ asl20 ];
    homepage = "https://github.com/agimus-project/agimus-franka-ros2";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}
