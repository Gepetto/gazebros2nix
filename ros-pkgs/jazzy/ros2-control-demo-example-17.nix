{
  lib,
  buildRosPackage,
  fetchFromGitHub,

  # nativeBuildInputs
  ament-cmake,

  # buildInputs
  backward-ros,
  diagnostic-updater,
  hardware-interface,
  pluginlib,
  rclcpp,
  rclcpp-lifecycle,
  ros2-control-cmake,

  # propagatedBuildInputs
  controller-manager,
  forward-command-controller,
  joint-state-broadcaster,
  joint-state-publisher-gui,
  joint-trajectory-controller,
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
  ament-cmake-ros,
  launch,
  launch-testing,
  launch-testing-ament-cmake,
  rclpy,
  urdfdom,

  # nativeCheckInputs
}:
buildRosPackage rec {
  pname = "ros-jazzy-ros2-control-demo-example-17";
  version = "0.0.0";

  src = fetchFromGitHub {
    owner = "ros-controls";
    repo = "ros2_control_demos";
    rev = "b98a0ee598a3975b9eded8062e2b1f5ba8360db1";
    hash = "sha256-cCsEoJeqr+ylVXVBALm7r46Veqc4G9RlIjyWgyL8xdM=";
  };
  sourceRoot = "source/example_17";

  __structuredAttrs = true;
  strictDeps = true;

  buildType = "ament_cmake";

  nativeBuildInputs = [
    ament-cmake
  ];
  buildInputs = [
    ament-cmake
    backward-ros
    diagnostic-updater
    hardware-interface
    pluginlib
    rclcpp
    rclcpp-lifecycle
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
    description = "Demo package of `ros2_control` hardware for RRBot with Hardware Component that publishes diagnostics";
    license = with lib.licenses; [ asl20 ];
    homepage = "https://github.com/ros-controls/ros2_control_demos";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}
