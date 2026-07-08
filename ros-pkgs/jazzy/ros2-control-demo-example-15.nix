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
    rev = "b98a0ee598a3975b9eded8062e2b1f5ba8360db1";
    hash = "sha256-cCsEoJeqr+ylVXVBALm7r46Veqc4G9RlIjyWgyL8xdM=";
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
