{
  lib,
  buildRosPackage,
  fetchFromGitHub,

  # nativeBuildInputs
  ament-cmake,

  # buildInputs
  ament-cmake-auto,
  gz-plugin-vendor,
  gz-sim-vendor,

  # propagatedBuildInputs
  launch,
  launch-param-builder,
  launch-ros,
  odri-dual-motor-testbed-description,
  odri-gz-ros2-control,
  ros-gz-sim,
  ros2launch,
  xacro,

  # checkInputs
  ament-cmake-gtest,
  ament-lint-auto,
  ament-lint-common,
  launch-testing-ament-cmake,
  rclcpp,
  sensor-msgs,

  # nativeCheckInputs
}:
buildRosPackage rec {
  pname = "ros-jazzy-odri-dual-motor-testbed-gazebo";
  version = "1.0.0";

  src = fetchFromGitHub {
    owner = "stack-of-tasks";
    repo = "odri_dual_motor_testbed_robot";
    rev = "97b06beb4753b3c6a1d64cf33c833d5bc9b9b0b5";
    hash = "sha256-vsMkKL0bL04UkfUeEfL5+rx3pQa9jOEx2uGCIqxKHpU=";
  };
  sourceRoot = "source/odri_dual_motor_testbed_gazebo";

  __structuredAttrs = true;
  strictDeps = true;

  buildType = "ament_cmake";

  nativeBuildInputs = [
    ament-cmake
  ];
  buildInputs = [
    ament-cmake
    ament-cmake-auto
    gz-plugin-vendor
    gz-sim-vendor
  ];
  propagatedBuildInputs = [
    gz-plugin-vendor
    launch
    launch-param-builder
    launch-ros
    odri-dual-motor-testbed-description
    odri-gz-ros2-control
    ros-gz-sim
    ros2launch
    xacro
  ];
  checkInputs = [
    ament-cmake-gtest
    ament-lint-auto
    ament-lint-common
    launch-testing-ament-cmake
    rclcpp
    sensor-msgs
  ];
  nativeCheckInputs = [
  ];

  doCheck = true;

  meta = {
    description = "Package starting the ODRI dual motor testbed robot in Gazebo";
    license = with lib.licenses; [ asl20 ];
    homepage = "https://github.com/stack-of-tasks/odri_dual_motor_testbed_robot";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}
