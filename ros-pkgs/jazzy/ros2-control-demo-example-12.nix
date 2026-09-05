{
  lib,
  buildRosPackage,
  fetchFromGitHub,

  # nativeBuildInputs
  ament-cmake,

  # buildInputs
  backward-ros,
  controller-manager,
  hardware-interface,
  pluginlib,
  rclcpp,
  rclcpp-lifecycle,
  ros2-control-cmake,
  std-msgs,

  # propagatedBuildInputs
  forward-command-controller,
  joint-state-broadcaster,
  joint-state-publisher-gui,
  robot-state-publisher,
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
  writableTmpDirAsHomeHook,
}:
buildRosPackage rec {
  pname = "ros-jazzy-ros2-control-demo-example-12";
  version = "0.0.0";

  src = fetchFromGitHub {
    owner = "ros-controls";
    repo = "ros2_control_demos";
    rev = "bd78ea5c413607df3153fc9b99a4455ebd0615c9";
    hash = "sha256-qkeX3P6mbslOIikT8506xqEdYAQbLTs3JXzhdcwNliw=";
  };
  sourceRoot = "source/example_12";

  __structuredAttrs = true;
  strictDeps = true;

  buildType = "ament_cmake";

  nativeBuildInputs = [
    ament-cmake
  ];
  buildInputs = [
    ament-cmake
    backward-ros
    controller-manager
    hardware-interface
    pluginlib
    rclcpp
    rclcpp-lifecycle
    ros2-control-cmake
    std-msgs
  ];
  propagatedBuildInputs = [
    backward-ros
    controller-manager
    forward-command-controller
    hardware-interface
    joint-state-broadcaster
    joint-state-publisher-gui
    pluginlib
    rclcpp
    rclcpp-lifecycle
    robot-state-publisher
    ros2-control-demo-description
    ros2-controllers-test-nodes
    ros2controlcli
    rviz2
    std-msgs
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
    description = "Demo package of `ros2_control` simulation with RRbot.";
    license = with lib.licenses; [ asl20 ];
    homepage = "https://github.com/ros-controls/ros2_control_demos";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}
