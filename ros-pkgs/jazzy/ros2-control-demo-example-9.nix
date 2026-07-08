{
  lib,
  buildRosPackage,
  fetchFromGitHub,

  # nativeBuildInputs
  ament-cmake,

  # buildInputs
  backward-ros,
  hardware-interface,
  pluginlib,
  rclcpp,
  rclcpp-lifecycle,
  ros2-control-cmake,

  # propagatedBuildInputs
  controller-manager,
  forward-command-controller,
  gz-ros2-control,
  joint-state-broadcaster,
  joint-state-publisher-gui,
  joint-trajectory-controller,
  robot-state-publisher,
  ros-gz-bridge,
  ros-gz-sim,
  ros2-control-demo-description,
  ros2-controllers-test-nodes,
  ros2controlcli,
  rviz2,
  xacro,

  # checkInputs
  ament-cmake-pytest,
  ament-cmake-ros,
  launch,
  launch-testing,
  launch-testing-ament-cmake,
  rclpy,
  urdfdom,

  # nativeCheckInputs
}:
buildRosPackage rec {
  pname = "ros-jazzy-ros2-control-demo-example-9";
  version = "0.0.0";

  src = fetchFromGitHub {
    owner = "ros-controls";
    repo = "ros2_control_demos";
    rev = "b98a0ee598a3975b9eded8062e2b1f5ba8360db1";
    hash = "sha256-cCsEoJeqr+ylVXVBALm7r46Veqc4G9RlIjyWgyL8xdM=";
  };
  sourceRoot = "source/example_9";

  __structuredAttrs = true;
  strictDeps = true;

  buildType = "ament_cmake";

  nativeBuildInputs = [
    ament-cmake
  ];
  buildInputs = [
    ament-cmake
    backward-ros
    hardware-interface
    pluginlib
    rclcpp
    rclcpp-lifecycle
    ros2-control-cmake
  ];
  propagatedBuildInputs = [
    backward-ros
    controller-manager
    forward-command-controller
    gz-ros2-control
    hardware-interface
    joint-state-broadcaster
    joint-state-publisher-gui
    joint-trajectory-controller
    pluginlib
    rclcpp
    rclcpp-lifecycle
    robot-state-publisher
    ros-gz-bridge
    ros-gz-sim
    ros2-control-demo-description
    ros2-controllers-test-nodes
    ros2controlcli
    rviz2
    xacro
  ];
  checkInputs = [
    ament-cmake-pytest
    ament-cmake-ros
    launch
    launch-testing
    launch-testing-ament-cmake
    rclpy
    urdfdom
  ];
  nativeCheckInputs = [
  ];

  doCheck = false;

  meta = {
    description = "Demo package of `ros2_control` simulation with RRbot.";
    license = with lib.licenses; [ asl20 ];
    homepage = "https://github.com/ros-controls/ros2_control_demos";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}
