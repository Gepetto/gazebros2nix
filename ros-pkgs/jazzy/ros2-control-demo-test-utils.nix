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
    rev = "bd78ea5c413607df3153fc9b99a4455ebd0615c9";
    hash = "sha256-qkeX3P6mbslOIikT8506xqEdYAQbLTs3JXzhdcwNliw=";
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
