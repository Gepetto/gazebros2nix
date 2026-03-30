{
  lib,
  buildRosPackage,
  fetchFromGitHub,

  # nativeBuildInputs
  ament-cmake-auto,
  ament-cmake-python,

  # buildInputs
  backward-ros,
  control-msgs,
  controller-manager-msgs,
  lifecycle-msgs,
  moveit-ros-planning-interface,
  play-motion2-msgs,
  rclcpp,
  rclcpp-action,
  rclcpp-components,
  rclcpp-lifecycle,
  sensor-msgs,
  std-msgs,
  trajectory-msgs,

  # propagatedBuildInputs
  launch,
  launch-ros,

  # checkInputs
  ament-cmake-gtest,
  ament-cmake-pytest,
  ament-index-cpp,
  ament-lint-auto,
  ament-lint-common,
  controller-interface,
  controller-manager,
  hardware-interface,
  joint-state-broadcaster,
  joint-trajectory-controller,
  launch-testing-ament-cmake,
  pluginlib,
  realtime-tools,
  robot-state-publisher,
  xacro,

  # nativeCheckInputs
}:
buildRosPackage rec {
  pname = "ros-jazzy-play-motion2";
  version = "1.8.3";

  src = fetchFromGitHub {
    owner = "Tiago-Pro-Harmonic";
    repo = "play_motion2";
    rev = "f1bbfcc4c9fbe9a05181a18214003360480d8575";
    hash = "sha256-Cq3r+KePWMpTvuo7Z4U7NQNyvhfffUTNymYkauqcYFA=";
  };
  sourceRoot = "source/play_motion2";

  __structuredAttrs = true;
  strictDeps = true;

  buildType = "ament_cmake";

  nativeBuildInputs = [
    ament-cmake-auto
    ament-cmake-python
  ];
  buildInputs = [
    ament-cmake-auto
    ament-cmake-python
    backward-ros
    control-msgs
    controller-manager-msgs
    lifecycle-msgs
    moveit-ros-planning-interface
    play-motion2-msgs
    rclcpp
    rclcpp-action
    rclcpp-components
    rclcpp-lifecycle
    sensor-msgs
    std-msgs
    trajectory-msgs
  ];
  propagatedBuildInputs = [
    launch
    launch-ros
  ];
  checkInputs = [
    ament-cmake-gtest
    ament-cmake-pytest
    ament-index-cpp
    ament-lint-auto
    ament-lint-common
    controller-interface
    controller-manager
    hardware-interface
    joint-state-broadcaster
    joint-trajectory-controller
    launch-testing-ament-cmake
    pluginlib
    realtime-tools
    robot-state-publisher
    xacro
  ];
  nativeCheckInputs = [
  ];

  doCheck = false;

  meta = {
    description = "Play a pre-recorded motion on a robot";
    license = with lib.licenses; [ asl20 ];
    homepage = "https://github.com/Tiago-Pro-Harmonic/play_motion2";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}
