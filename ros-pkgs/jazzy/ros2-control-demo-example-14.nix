{
  lib,
  buildRosPackage,
  fetchFromGitHub,

  # nativeBuildInputs
  ament-cmake,

  # buildInputs
  controller-manager,
  hardware-interface,
  pluginlib,
  rclcpp,
  rclcpp-lifecycle,
  realtime-tools,
  ros2-control-cmake,

  # propagatedBuildInputs
  forward-command-controller,
  joint-state-broadcaster,
  joint-state-publisher-gui,
  robot-state-publisher,
  ros2-control-demo-description,
  ros2-controllers-test-nodes,
  ros2controlcli,
  ros2launch,
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
  writableTmpDirAsHomeHook,
}:
buildRosPackage rec {
  pname = "ros-jazzy-ros2-control-demo-example-14";
  version = "0.0.0";

  src = fetchFromGitHub {
    owner = "ros-controls";
    repo = "ros2_control_demos";
    rev = "c8f354577269c06d5b9e6f4253ab877dd56d51dc";
    hash = "sha256-dTyAfti1Z9yMfy5Yg0k5VZWDAD8rmYGdV+EOovki+2o=";
  };
  sourceRoot = "source/example_14";

  __structuredAttrs = true;
  strictDeps = true;

  buildType = "ament_cmake";

  nativeBuildInputs = [
    ament-cmake
  ];
  buildInputs = [
    ament-cmake
    controller-manager
    hardware-interface
    pluginlib
    rclcpp
    rclcpp-lifecycle
    realtime-tools
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
    ament-cmake-ros
    launch
    launch-testing
    launch-testing-ament-cmake
    rclpy
    urdfdom
  ];
  nativeCheckInputs = [
    writableTmpDirAsHomeHook
  ];

  doCheck = false;

  meta = {
    description = "Modular Robots with actuators not providing states and with additional sensors.";
    license = with lib.licenses; [ asl20 ];
    homepage = "https://github.com/ros-controls/ros2_control_demos";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}
