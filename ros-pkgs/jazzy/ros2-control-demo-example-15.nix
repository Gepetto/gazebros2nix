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
  forward-command-controller,
  joint-state-broadcaster,
  joint-trajectory-controller,
  robot-state-publisher,
  ros2-control-demo-example-1,
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

  # nativeCheckInputs
}:
buildRosPackage rec {
  pname = "ros-jazzy-ros2-control-demo-example-15";
  version = "0.0.0";

  src = fetchFromGitHub {
    owner = "ros-controls";
    repo = "ros2_control_demos";
    rev = "4b6ab8fca6af3a754a2b1249a50cb5de2e51c8d1";
    hash = "sha256-OO8j+qFf3qovtIPClyVGcx7vyYSwWHWDt9I64kCgf/Y=";
  };
  sourceRoot = "source/example_15";

  __structuredAttrs = true;
  strictDeps = true;

  buildType = "ament_cmake";

  nativeBuildInputs = [
    ament-cmake
  ];
  buildInputs = [
    ament-cmake
    ros2-control-cmake
  ];
  propagatedBuildInputs = [
    controller-manager
    forward-command-controller
    joint-state-broadcaster
    joint-trajectory-controller
    robot-state-publisher
    ros2-control-demo-example-1
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
  nativeCheckInputs = [
  ];

  doCheck = false;

  meta = {
    description = "Demo package of `ros2_control` namespaced controller managers.";
    license = with lib.licenses; [ asl20 ];
    homepage = "https://github.com/ros-controls/ros2_control_demos";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}
