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
}:
buildRosPackage rec {
  pname = "ros-jazzy-ros2-control-demo-example-11";
  version = "0.0.0";

  src = fetchFromGitHub {
    owner = "ros-controls";
    repo = "ros2_control_demos";
    rev = "e9602bc2683fd01f76bf5c15d312e216c6db9b26";
    hash = "sha256-VMpoOTSCaWP0eNfFYspKvpren+3nDRP1sgfmFkCUJTM=";
  };
  sourceRoot = "source/example_11";

  buildType = "ament_cmake";

  nativeBuildInputs = [
    ament-cmake
  ];
  buildInputs = [
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

  doCheck = false;

  meta = {
    description = "Demo package of `ros2_control` hardware for a carlike robot with two wheels in front that steer and two wheels in the back that drive.";
    license = with lib.licenses; [ asl20 ];
    homepage = "https://github.com/ros-controls/ros2_control_demos";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}
