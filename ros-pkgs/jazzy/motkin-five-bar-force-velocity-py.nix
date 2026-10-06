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
  pname = "ros-jazzy-motkin-five-bar-force-velocity-py";
  version = "1.0.1";

  src = fetchFromGitHub {
    owner = "Gepetto";
    repo = "motkin-dual-motor-testbed-robot";
    tag = "v${version}";
    hash = "sha256-DlwOyh1HqqNfH5CH8HXmfrmvzCg6pghYavjPU1ZU3C4=";
  };
  sourceRoot = "source/motkin_dual_motor_testbed_controllers/motkin_five_bar_force_velocity_py";

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
    motkin_dual_motor_testbed five-bar mechanism. Drives the joints through
    the motkin_forward_command_controller ~/commands topic, using an
    analytical (closed-form) Jacobian derived from the URDF geometry --
    no Pinocchio or other rigid-body library involved.";
    license = with lib.licenses; [ asl20 ];
    homepage = "https://github.com/Gepetto/motkin-dual-motor-testbed-robot";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}
