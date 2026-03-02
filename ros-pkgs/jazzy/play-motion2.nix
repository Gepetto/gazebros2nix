{
  lib,
  buildRosPackage,
  fetchFromGitHub,

  # nativeBuildInputs
  ament-cmake-auto,

  # buildInputs
  control-msgs,
  controller-manager-msgs,
  lifecycle-msgs,
  moveit-ros-planning-interface,
  play-motion2-msgs,
  rclcpp,
  rclcpp-action,
  rclcpp-lifecycle,
  sensor-msgs,
  std-msgs,
  trajectory-msgs,

  # propagatedBuildInputs
  launch,
  launch-ros,

  # checkInputs
  ament-cmake-gtest,
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
}:
buildRosPackage rec {
  pname = "ros-jazzy-play-motion2";
  version = "1.5.1";

  src = fetchFromGitHub {
    owner = "Tiago-Harmonic";
    repo = "play_motion2";
    rev = "bf8f54640ac27215a3e93e9bd06fbe4cd8c72ced";
    hash = "sha256-ZIQju0qigUlp1gbClm849Vxl10gqjczX/W/zY6zXB+g=";
  };
  sourceRoot = "source/play_motion2";

  buildType = "ament_cmake";

  nativeBuildInputs = [
    ament-cmake-auto
  ];
  buildInputs = [
    control-msgs
    controller-manager-msgs
    lifecycle-msgs
    moveit-ros-planning-interface
    play-motion2-msgs
    rclcpp
    rclcpp-action
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

  doCheck = false;

  meta = {
    description = "Play a pre-recorded motion on a robot";
    license = with lib.licenses; [ asl20 ];
    homepage = "https://github.com/Tiago-Harmonic/play_motion2";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}
