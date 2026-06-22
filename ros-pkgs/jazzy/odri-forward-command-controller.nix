{
  lib,
  buildRosPackage,
  fetchFromGitHub,

  # nativeBuildInputs
  ament-cmake,
  writableTmpDirAsHomeHook,

  # buildInputs
  controller-interface,
  generate-parameter-library,
  hardware-interface,
  pluginlib,
  rclcpp,
  rclcpp-lifecycle,
  realtime-tools,
  std-msgs,

  # propagatedBuildInputs

  # checkInputs
  ament-cmake-gmock,
  ament-lint-auto,
  ament-lint-common,

  # nativeCheckInputs
}:
buildRosPackage rec {
  pname = "ros-jazzy-odri-forward-command-controller";
  version = "0.1.0";

  src = fetchFromGitHub {
    owner = "stack-of-tasks";
    repo = "odri_forward_command_controller";
    rev = "fe9fd167cffeede19867b3d40acc839058d3174a";
    hash = "sha256-RqPMTgF9CT6HX6kyF1fGj2kKkuoyNi8EcNb/+qDU++s=";
  };
  sourceRoot = "source/";

  __structuredAttrs = true;
  strictDeps = true;

  buildType = "ament_cmake";

  nativeBuildInputs = [
    ament-cmake
    generate-parameter-library
    writableTmpDirAsHomeHook
  ];
  buildInputs = [
    ament-cmake
    controller-interface
    generate-parameter-library
    hardware-interface
    pluginlib
    rclcpp
    rclcpp-lifecycle
    realtime-tools
    std-msgs
  ];
  propagatedBuildInputs = [
    controller-interface
    generate-parameter-library
    hardware-interface
    pluginlib
    rclcpp
    rclcpp-lifecycle
    realtime-tools
    std-msgs
  ];
  checkInputs = [
    ament-cmake-gmock
    ament-lint-auto
    ament-lint-common
  ];
  nativeCheckInputs = [
  ];

  doCheck = true;

  meta = {
    description = "Forward command controller for ODRI joints that sends position, velocity,
    effort, gain_kp and gain_kd commands together via a single topic using
    std_msgs/Float64MultiArray. The flat data array is ordered as:
    [pos×n | vel×n | eff×n | gain_kp×n | gain_kd×n] for n joints.
    Per-value NaN entries are silently skipped for partial updates.";
    license = with lib.licenses; [ asl20 ];
    homepage = "https://github.com/stack-of-tasks/odri_forward_command_controller";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}
