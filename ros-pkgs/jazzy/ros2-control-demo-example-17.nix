{
  lib,
  buildRosPackage,
  fetchFromGitHub,

  # nativeBuildInputs
  ament-cmake,
  ros2-control-cmake,

  # propagatedBuildInputs
  backward-ros,
  controller-manager,
  diagnostic-updater,
  forward-command-controller,
  hardware-interface,
  joint-state-broadcaster,
  joint-state-publisher-gui,
  joint-trajectory-controller,
  pluginlib,
  rclcpp,
  rclcpp-lifecycle,
  robot-state-publisher,
  ros2-control-demo-description,
  ros2-controllers-test-nodes,
  ros2controlcli,
  ros2launch,
  rqt-joint-trajectory-controller,
  rviz2,
  xacro,

  # checkInputs
  ament-cmake-pytest,
  launch,
  launch-testing,
  urdfdom,
  rclpy,
}:
buildRosPackage rec {
  pname = "ros-jazzy-ros2-control-demo-example-17";
  version = "0.0.0";

  src = fetchFromGitHub {
    owner = "ros-controls";
    repo = "ros2_control_demos";
    rev = "7732eec0d301b0544ff4b8a6fe0ed3842c475d86";
    hash = "sha256-bJxaqS20rEyDHpkkDtOd0rbYeuwrdDK212G8Qw2ZF/k=";
  };
  sourceRoot = "source/example_17";

  buildType = "ament_cmake";

  nativeBuildInputs = [
    ament-cmake
    ros2-control-cmake
  ];
  propagatedBuildInputs = [
    backward-ros
    controller-manager
    diagnostic-updater
    forward-command-controller
    hardware-interface
    joint-state-broadcaster
    joint-state-publisher-gui
    joint-trajectory-controller
    pluginlib
    rclcpp
    rclcpp-lifecycle
    robot-state-publisher
    ros2-control-demo-description
    ros2-controllers-test-nodes
    ros2controlcli
    ros2launch
    rqt-joint-trajectory-controller
    rviz2
    xacro
  ];
  checkInputs = [
    ament-cmake-pytest
    launch
    launch-testing
    urdfdom
    rclpy
  ];

  meta = {
    description = "Demo package of `ros2_control` hardware for RRBot with Hardware Component that publishes diagnostics";
    license = with lib.licenses; [ asl20 ];
    homepage = "https://github.com/ros-controls/ros2_control_demos";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}
