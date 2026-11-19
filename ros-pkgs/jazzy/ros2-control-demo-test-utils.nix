{
  lib,
  buildRosPackage,
  fetchFromGitHub,

  # nativeBuildInputs

  # buildInputs
  rclpy,
  sensor-msgs,
  std-msgs,

  # propagatedBuildInputs

  # checkInputs
  python3Packages,

  # nativeCheckInputs
  writableTmpDirAsHomeHook,
}:
buildRosPackage rec {
  pname = "ros-jazzy-ros2-control-demo-test-utils";
  version = "0.0.0";

  src = fetchFromGitHub {
    owner = "ros-controls";
    repo = "ros2_control_demos";
    rev = "5b8777c65ee8bc6eff74d24ce67438cc50cdc591";
    hash = "sha256-ekhXOMT6hec6CQMzeUSfnxd5Z6bgclKL7ICg2Usbkdw=";
  };
  sourceRoot = "source/ros2_control_demo_test_utils";

  __structuredAttrs = true;
  strictDeps = true;

  buildType = "ament_python";

  nativeBuildInputs = [
  ];
  buildInputs = [
    rclpy
    sensor-msgs
    std-msgs
  ];
  propagatedBuildInputs = [
    rclpy
    sensor-msgs
    std-msgs
  ];
  checkInputs = [
    python3Packages.pytest
  ];
  nativeCheckInputs = [
    writableTmpDirAsHomeHook
  ];

  doCheck = true;

  meta = {
    description = "Shared utilities for testing movement in ros2_control demos.";
    license = with lib.licenses; [ asl20 ];
    homepage = "https://github.com/ros-controls/ros2_control_demos";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}
