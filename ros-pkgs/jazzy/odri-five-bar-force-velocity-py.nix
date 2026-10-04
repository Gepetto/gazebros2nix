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

  # checkInputs
  ament-copyright,
  ament-flake8,
  ament-pep257,
  python3Packages,

  # nativeCheckInputs
  writableTmpDirAsHomeHook,
}:
buildRosPackage rec {
  pname = "ros-jazzy-odri-five-bar-force-velocity-py";
  version = "0.1.0";

  src = fetchFromGitHub {
    owner = "stack-of-tasks";
    repo = "odri_dual_motor_testbed_robot";
    rev = "8869d16e271536089e7ba288217b0ff514614113";
    hash = "sha256-i2gpZkyHXvELIeQbHyONA58sotpB07qKROD3LRH4C64=";
  };
  sourceRoot = "source/odri_dual_motor_testbed_controllers/odri_five_bar_force_velocity_py";

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
    geometry-msgs
    rclpy
    sensor-msgs
    std-msgs
  ];
  checkInputs = [
    ament-copyright
    ament-flake8
    ament-pep257
    python3Packages.pytest
  ];
  nativeCheckInputs = [
    writableTmpDirAsHomeHook
  ];

  doCheck = true;

  meta = {
    description = "Python endpoint force-to-velocity controller (qdot = J^T f_c) for the
    odri_dual_motor_testbed five-bar mechanism. Drives the joints through
    the odri_forward_command_controller ~/commands topic, using an
    analytical (closed-form) Jacobian derived from the URDF geometry --
    no Pinocchio or other rigid-body library involved.";
    license = with lib.licenses; [ asl20 ];
    homepage = "https://github.com/stack-of-tasks/odri_dual_motor_testbed_robot";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}
