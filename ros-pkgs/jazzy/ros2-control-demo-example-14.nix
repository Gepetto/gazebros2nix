{
  lib,
  buildRosPackage,
  fetchFromGitHub,

  # nativeBuildInputs
  ament-cmake,
  ros2-control-cmake,

  # propagatedBuildInputs
  controller-manager,
  forward-command-controller,
  hardware-interface,
  joint-state-broadcaster,
  joint-state-publisher-gui,
  pluginlib,
  rclcpp,
  rclcpp-lifecycle,
  realtime-tools,
  robot-state-publisher,
  ros2-control-demo-description,
  ros2-controllers-test-nodes,
  ros2controlcli,
  ros2launch,
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
  pname = "ros-jazzy-ros2-control-demo-example-14";
  version = "0.0.0";

  src = fetchFromGitHub {
    owner = "ros-controls";
    repo = "ros2_control_demos";
    rev = "7732eec0d301b0544ff4b8a6fe0ed3842c475d86";
    hash = "sha256-bJxaqS20rEyDHpkkDtOd0rbYeuwrdDK212G8Qw2ZF/k=";
  };
  sourceRoot = "source/example_14";

  buildType = "ament_cmake";

  nativeBuildInputs = [
    ament-cmake
    ros2-control-cmake
  ];
  propagatedBuildInputs = [
    controller-manager
    forward-command-controller
    hardware-interface
    joint-state-broadcaster
    joint-state-publisher-gui
    pluginlib
    rclcpp
    rclcpp-lifecycle
    realtime-tools
    robot-state-publisher
    ros2-control-demo-description
    ros2-controllers-test-nodes
    ros2controlcli
    ros2launch
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
    description = "Modular Robots with actuators not providing states and with additional sensors.";
    license = with lib.licenses; [ asl20 ];
    homepage = "https://github.com/ros-controls/ros2_control_demos";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}
