{
  lib,
  buildRosPackage,
  fetchFromGitHub,

  # nativeBuildInputs
  ament-cmake,

  # buildInputs
  backward-ros,
  control-msgs,
  controller-interface,
  hardware-interface,
  kdl-parser,
  pluginlib,
  rclcpp,
  rclcpp-lifecycle,
  realtime-tools,
  ros2-control-cmake,
  trajectory-msgs,

  # propagatedBuildInputs
  controller-manager,
  joint-state-broadcaster,
  joint-state-publisher-gui,
  launch,
  launch-ros,
  robot-state-publisher,
  ros2-control-demo-description,
  ros2controlcli,
  ros2launch,
  rviz2,
  urdf,
  xacro,

  # checkInputs
  ament-cmake-pytest,
  ament-cmake-ros,
  launch-testing,
  launch-testing-ament-cmake,
  rclpy,
  urdfdom,

# nativeCheckInputs
}:
buildRosPackage rec {
  pname = "ros-jazzy-ros2-control-demo-example-7";
  version = "0.0.0";

  src = fetchFromGitHub {
    owner = "ros-controls";
    repo = "ros2_control_demos";
    rev = "ee26c5a609e86f642ea470206e2f40975c363866";
    hash = "sha256-1nxaQgj0lwJ68IuSG4+vWAdXcKBSu6rmwQPFrjJSBvc=";
  };
  sourceRoot = "source/example_7";

  __structuredAttrs = true;
  strictDeps = true;

  buildType = "ament_cmake";

  nativeBuildInputs = [
    ament-cmake
  ];
  buildInputs = [
    ament-cmake
    backward-ros
    control-msgs
    controller-interface
    hardware-interface
    kdl-parser
    pluginlib
    rclcpp
    rclcpp-lifecycle
    realtime-tools
    ros2-control-cmake
    trajectory-msgs
  ];
  propagatedBuildInputs = [
    controller-manager
    joint-state-broadcaster
    joint-state-publisher-gui
    launch
    launch-ros
    robot-state-publisher
    ros2-control-demo-description
    ros2controlcli
    ros2launch
    rviz2
    urdf
    xacro
  ];
  checkInputs = [
    ament-cmake-pytest
    ament-cmake-ros
    launch-testing
    launch-testing-ament-cmake
    rclpy
    urdfdom
  ];
  nativeCheckInputs = [
  ];

  doCheck = false;

  meta = {
    description = "Demo for 6 DOF robot.";
    license = with lib.licenses; [ asl20 ];
    homepage = "https://github.com/ros-controls/ros2_control_demos";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}
