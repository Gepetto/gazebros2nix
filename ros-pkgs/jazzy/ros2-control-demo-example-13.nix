{
  lib,
  buildRosPackage,
  fetchFromGitHub,

  # nativeBuildInputs
  ament-cmake,

  # buildInputs
  controller-manager,
  ros2-control-cmake,

  # propagatedBuildInputs
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
  rqt-controller-manager,
  rviz2,
  xacro,

  # checkInputs
  ament-cmake-pytest,
  ament-cmake-ros,
  launch,
  launch-testing,
  launch-testing-ament-cmake,
  rclpy,
  urdf-test,
  urdfdom,

  # nativeCheckInputs
  writableTmpDirAsHomeHook,
}:
buildRosPackage rec {
  pname = "ros-jazzy-ros2-control-demo-example-13";
  version = "0.0.0";

  src = fetchFromGitHub {
    owner = "ros-controls";
    repo = "ros2_control_demos";
    rev = "3c35e783e268e5235bb042a71c68112a3ecb777e";
    hash = "sha256-qcsGDDCW8il3IhFTbMy7AXcTcdm8FA9sWNqdDQbsgDw=";
  };
  sourceRoot = "source/example_13";

  __structuredAttrs = true;
  strictDeps = true;

  buildType = "ament_cmake";

  nativeBuildInputs = [
    ament-cmake
  ];
  buildInputs = [
    ament-cmake
    controller-manager
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
    rqt-controller-manager
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
    urdf-test
    urdfdom
  ];
  nativeCheckInputs = [
    writableTmpDirAsHomeHook
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
