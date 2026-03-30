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
  bicycle-steering-controller,
  controller-manager,
  joint-state-broadcaster,
  joint-state-publisher-gui,
  robot-state-publisher,
  ros2-control-demo-description,
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
  launch-testing-ros,
  rclpy,
  urdfdom,

  # nativeCheckInputs
}:
buildRosPackage rec {
  pname = "ros-jazzy-ros2-control-demo-example-11";
  version = "0.0.0";

  src = fetchFromGitHub {
    owner = "ros-controls";
    repo = "ros2_control_demos";
    rev = "ee26c5a609e86f642ea470206e2f40975c363866";
    hash = "sha256-1nxaQgj0lwJ68IuSG4+vWAdXcKBSu6rmwQPFrjJSBvc=";
  };
  sourceRoot = "source/example_11";

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
    bicycle-steering-controller
    controller-manager
    joint-state-broadcaster
    joint-state-publisher-gui
    robot-state-publisher
    ros2-control-demo-description
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
    launch-testing-ros
    rclpy
    urdfdom
  ];
  nativeCheckInputs = [
  ];

  doCheck = false;

  meta = {
    description = "Demo package of `ros2_control` hardware for a carlike robot with two wheels in front that steer and two wheels in the back that drive.";
    license = with lib.licenses; [ asl20 ];
    homepage = "https://github.com/ros-controls/ros2_control_demos";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}
