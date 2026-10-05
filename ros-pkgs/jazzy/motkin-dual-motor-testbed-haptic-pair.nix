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
  motkin-dual-motor-testbed-gazebo,
  motkin-five-bar-force-velocity-controller,
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
  pname = "ros-jazzy-motkin-dual-motor-testbed-haptic-pair";
  version = "0.1.0";

  src = fetchFromGitHub {
    owner = "Gepetto";
    repo = "motkin-dual-motor-testbed-robot";
    rev = "b908e007ad56de145dc8eb2507ee1e5d1f82fc79";
    hash = "sha256-Bg7q+sILOjrFzTZ7VQ58yysFfNj89nV2RZiTRsZn8Cg=";
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
  ];
  propagatedBuildInputs = [
    geometry-msgs
    launch
    launch-ros
    motkin-dual-motor-testbed-gazebo
    motkin-five-bar-force-velocity-controller
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
