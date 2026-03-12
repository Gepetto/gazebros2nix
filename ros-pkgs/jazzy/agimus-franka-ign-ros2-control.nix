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

# nativeCheckInputs
}:
buildRosPackage rec {
  pname = "ros-jazzy-agimus-franka-ign-ros2-control";
  version = "1.0.0";

  src = fetchFromGitHub {
    owner = "agimus-project";
    repo = "agimus-franka-ros2";
    rev = "562d6087298b13ece3d8ee42a0f410246753b31e";
    hash = "sha256-020nGSNxJL2/yFhEIjjyy850WcUmjMO/+OL1OYU0oIE=";
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
