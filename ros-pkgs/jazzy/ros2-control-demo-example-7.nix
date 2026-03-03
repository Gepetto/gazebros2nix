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
}:
buildRosPackage rec {
  pname = "ros-jazzy-ros2-control-demo-example-7";
  version = "0.0.0";

  src = fetchFromGitHub {
    owner = "ros-controls";
    repo = "ros2_control_demos";
    rev = "0c90fefeccdde9f0dbcb6e081ef1d8bea4d57899";
    hash = "sha256-dttXCzycrHETWSo88f2TUDwFsRbzzKfz94ivy/J27fs=";
  };
  sourceRoot = "source/example_7";

  buildType = "ament_cmake";

  nativeBuildInputs = [
    ament-cmake
  ];
  buildInputs = [
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

  doCheck = false;

  meta = {
    description = "Demo for 6 DOF robot.";
    license = with lib.licenses; [ asl20 ];
    homepage = "https://github.com/ros-controls/ros2_control_demos";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}
