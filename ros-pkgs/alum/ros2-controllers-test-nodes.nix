{
  lib,
  buildRosPackage,
  fetchFromGitHub,

  # nativeBuildInputs

  # buildInputs
  rclpy,
  sensor-msgs,
  std-msgs,
  trajectory-msgs,

  # propagatedBuildInputs

  # checkInputs
  launch-ros,
  launch-testing-ros,
  python3Packages,

  # nativeCheckInputs
}:
buildRosPackage rec {
  pname = "ros-alum-ros2-controllers-test-nodes";
  version = "4.41.0";

  src = fetchFromGitHub {
    owner = "ros-controls";
    repo = "ros2_controllers";
    tag = version;
    hash = "sha256-+JDFzCLyZ3UAC/DTd/LBVLf+OnrDvzaFcZaxHTFwbr4=";
  };
  sourceRoot = "source/ros2_controllers_test_nodes";

  __structuredAttrs = true;
  strictDeps = true;

  buildType = "ament_python";

  nativeBuildInputs = [
  ];
  buildInputs = [
    rclpy
    sensor-msgs
    std-msgs
    trajectory-msgs
  ];
  propagatedBuildInputs = [
    rclpy
    sensor-msgs
    std-msgs
    trajectory-msgs
  ];
  checkInputs = [
    launch-ros
    launch-testing-ros
    python3Packages.pytest
  ];
  nativeCheckInputs = [
  ];

  doCheck = true;

  meta = {
    description = "Demo nodes for showing and testing functionalities of the ros2_control framework.";
    license = with lib.licenses; [ asl20 ];
    homepage = "https://github.com/ros-controls/ros2_controllers";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}
