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
  ignition-gazebo6,
  ignition-plugin,
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
  pname = "ros-humble-agimus-franka-ign-ros2-control";
  version = "1.0.0";

  src = fetchFromGitHub {
    owner = "agimus-project";
    repo = "agimus-franka-ros2";
    rev = "ebf734c0dfa09b0fc29cde12b678fed4a099f0db";
    hash = "sha256-O+xQSbQsqCSVXhj9bcfgJjIgySt7nvNJjLCft6I5TRY=";
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
    hardware-interface
    ignition-gazebo6
    ignition-plugin
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
    description = "fork of franka_ign_ros2_control for franka robots not maintained anymore by franka";
    license = with lib.licenses; [ asl20 ];
    homepage = "https://github.com/agimus-project/agimus-franka-ros2";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}
