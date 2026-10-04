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

  # propagatedBuildInputs
  launch,
  launch-ros,
  odri-dual-motor-testbed-gazebo,
  odri-five-bar-force-velocity-controller,
  ros2launch,

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
  pname = "ros-jazzy-odri-dual-motor-testbed-haptic-pair";
  version = "0.1.0";

  src = fetchFromGitHub {
    owner = "stack-of-tasks";
    repo = "odri_dual_motor_testbed_robot";
    rev = "8869d16e271536089e7ba288217b0ff514614113";
    hash = "sha256-i2gpZkyHXvELIeQbHyONA58sotpB07qKROD3LRH4C64=";
  };
  sourceRoot = "source/odri_dual_motor_testbed_haptic_pair";

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
  ];
  propagatedBuildInputs = [
    geometry-msgs
    launch
    launch-ros
    odri-dual-motor-testbed-gazebo
    odri-five-bar-force-velocity-controller
    rclpy
    ros2launch
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
    description = "Simulates two odri_dual_motor_testbed five-bar robots as a haptic pair
    in a single Gazebo world, each under its own ROS namespace. The leader
    runs odri_five_bar_force_velocity_controller and turns an external
    contact force (its haptic-sensor input) into motion; the follower runs
    the same controller and is driven by a relay of the leader's sensed
    contact force, so it reproduces the force -- and therefore the motion
    -- felt by the leader.";
    license = with lib.licenses; [ asl20 ];
    homepage = "https://github.com/stack-of-tasks/odri_dual_motor_testbed_robot";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}
