{
  lib,
  buildRosPackage,
  fetchFromGitHub,

  # nativeBuildInputs
  ament-cmake,
  ament-cmake-python,

  # buildInputs
  geometry-msgs,
  rclpy,
  sensor-msgs,
  std-msgs,

  # propagatedBuildInputs
  controller-manager,
  joint-state-broadcaster,
  launch,
  launch-ros,
  motkin-dual-motor-testbed-description,
  motkin-dual-motor-testbed-gazebo,
  motkin-dual-motor-testbed-hardware,
  motkin-five-bar-force-velocity-controller,
  motkin-forward-command-controller,
  robot-state-publisher,
  ros2launch,
  rviz2,
  xacro,

  # checkInputs
  ament-copyright,
  ament-mypy,
  ament-pep257,
  ament-xmllint,
  python3Packages,

  # nativeCheckInputs
  writableTmpDirAsHomeHook,
}:
buildRosPackage rec {
  pname = "ros-jazzy-motkin-dual-motor-testbed-haptic-pair";
  version = "1.1.0";

  src = fetchFromGitHub {
    owner = "Gepetto";
    repo = "motkin-dual-motor-testbed-robot";
    tag = "v${version}";
    hash = "sha256-xSp2/KlOReis2AaLKqJjMEd/7BfmfrGBFG3HfobqBqM=";
  };
  sourceRoot = "source/motkin_dual_motor_testbed_haptic_pair";

  __structuredAttrs = true;
  strictDeps = true;

  buildType = "ament_cmake";

  nativeBuildInputs = [
    ament-cmake
    ament-cmake-python
  ];
  buildInputs = [
    ament-cmake
    ament-cmake-python
    geometry-msgs
    rclpy
    sensor-msgs
    std-msgs
  ];
  propagatedBuildInputs = [
    controller-manager
    geometry-msgs
    joint-state-broadcaster
    launch
    launch-ros
    motkin-dual-motor-testbed-description
    motkin-dual-motor-testbed-gazebo
    motkin-dual-motor-testbed-hardware
    motkin-five-bar-force-velocity-controller
    motkin-forward-command-controller
    rclpy
    robot-state-publisher
    ros2launch
    rviz2
    sensor-msgs
    std-msgs
    xacro
  ];
  checkInputs = [
    ament-copyright
    ament-mypy
    ament-pep257
    ament-xmllint
    python3Packages.pytest
  ];
  nativeCheckInputs = [
    writableTmpDirAsHomeHook
  ];

  doCheck = true;

  meta = {
    description = "Simulates two motkin_dual_motor_testbed five-bar robots as a haptic pair
    in a single Gazebo world, each under its own ROS namespace. The leader
    runs motkin_five_bar_force_velocity_controller and turns an external
    contact force (its haptic-sensor input) into motion; the follower runs
    the same controller and is driven by a relay of the leader's sensed
    contact force, so it reproduces the force -- and therefore the motion
    -- felt by the leader.";
    license = with lib.licenses; [ asl20 ];
    homepage = "https://github.com/Gepetto/motkin-dual-motor-testbed-robot";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}
