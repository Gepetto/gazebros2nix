{
  lib,
  buildRosPackage,
  fetchFromGitHub,

  # nativeBuildInputs
  ament-cmake,
  ros2-control-cmake,

  # propagatedBuildInputs
  backward-ros,
  control-msgs,
  controller-interface,
  controller-manager,
  hardware-interface,
  joint-state-broadcaster,
  joint-state-publisher-gui,
  kdl-parser,
  launch,
  launch-ros,
  pluginlib,
  rclcpp,
  rclcpp-lifecycle,
  realtime-tools,
  robot-state-publisher,
  ros2-control-demo-description,
  ros2controlcli,
  ros2launch,
  rviz2,
  trajectory-msgs,
  urdf,
  xacro,

  # checkInputs
  ament-cmake-pytest,
  launch-testing,
  urdfdom,
  rclpy,
}:
buildRosPackage rec {
  pname = "ros-jazzy-ros2-control-demo-example-7";
  version = "0.0.0";

  src = fetchFromGitHub {
    owner = "ros-controls";
    repo = "ros2_control_demos";
    rev = "7732eec0d301b0544ff4b8a6fe0ed3842c475d86";
    hash = "sha256-bJxaqS20rEyDHpkkDtOd0rbYeuwrdDK212G8Qw2ZF/k=";
  };
  sourceRoot = "source/example_7";

  buildType = "ament_cmake";

  nativeBuildInputs = [
    ament-cmake
    ros2-control-cmake
  ];
  propagatedBuildInputs = [
    backward-ros
    control-msgs
    controller-interface
    controller-manager
    hardware-interface
    joint-state-broadcaster
    joint-state-publisher-gui
    kdl-parser
    launch
    launch-ros
    pluginlib
    rclcpp
    rclcpp-lifecycle
    realtime-tools
    robot-state-publisher
    ros2-control-demo-description
    ros2controlcli
    ros2launch
    rviz2
    trajectory-msgs
    urdf
    xacro
  ];
  checkInputs = [
    ament-cmake-pytest
    launch-testing
    urdfdom
    rclpy
  ];

  meta = {
    description = "Demo for 6 DOF robot.";
    license = with lib.licenses; [ asl20 ];
    homepage = "https://github.com/ros-controls/ros2_control_demos";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}
