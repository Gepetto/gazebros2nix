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
}:
buildRosPackage rec {
  pname = "ros-jazzy-ros2-control-demo-example-3";
  version = "0.0.0";

  src = fetchFromGitHub {
    owner = "ros-controls";
    repo = "ros2_control_demos";
    rev = "4b6ab8fca6af3a754a2b1249a50cb5de2e51c8d1";
    hash = "sha256-OO8j+qFf3qovtIPClyVGcx7vyYSwWHWDt9I64kCgf/Y=";
  };
  sourceRoot = "source/example_3";

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
  ];

  doCheck = false;

  meta = {
    description = "Demo package of `ros2_control` hardware for RRbot with multi interface.";
    license = with lib.licenses; [ asl20 ];
    homepage = "https://github.com/ros-controls/ros2_control_demos";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}
