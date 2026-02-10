{
  lib,
  buildRosPackage,
  fetchFromGitHub,

  # nativeBuildInputs
  ament-cmake,

  # buildInputs
  ros2-control-cmake,

  # propagatedBuildInputs
  controller-manager,
  force-torque-sensor-broadcaster,
  forward-command-controller,
  joint-state-broadcaster,
  robot-state-publisher,
  ros2-control-demo-description,
  ros2-control-demo-example-4,
  ros2-control-demo-example-5,
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
}:
buildRosPackage rec {
  pname = "ros-jazzy-ros2-control-demo-example-13";
  version = "0.0.0";

  src = fetchFromGitHub {
    owner = "ros-controls";
    repo = "ros2_control_demos";
    rev = "e9602bc2683fd01f76bf5c15d312e216c6db9b26";
    hash = "sha256-VMpoOTSCaWP0eNfFYspKvpren+3nDRP1sgfmFkCUJTM=";
  };
  sourceRoot = "source/example_13";

  buildType = "ament_cmake";

  nativeBuildInputs = [
    ament-cmake
  ];
  buildInputs = [
    ros2-control-cmake
  ];
  propagatedBuildInputs = [
    controller-manager
    force-torque-sensor-broadcaster
    forward-command-controller
    joint-state-broadcaster
    robot-state-publisher
    ros2-control-demo-description
    ros2-control-demo-example-4
    ros2-control-demo-example-5
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

  doCheck = false;

  meta = {
    description = "Demo package of `ros2_control` simulation with multiple robots.";
    license = with lib.licenses; [ asl20 ];
    homepage = "https://github.com/ros-controls/ros2_control_demos";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}
