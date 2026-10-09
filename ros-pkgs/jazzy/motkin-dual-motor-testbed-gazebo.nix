{
  lib,
  buildRosPackage,
  fetchFromGitHub,

  # nativeBuildInputs
  ament-cmake,
  rosdoc2,

  # buildInputs
  ament-cmake-auto,
  gz-plugin-vendor,
  gz-sim-vendor,

  # propagatedBuildInputs
  controller-manager,
  joint-state-broadcaster,
  launch,
  launch-param-builder,
  launch-ros,
  motkin-dual-motor-testbed-description,
  motkin-forward-command-controller,
  motkin-gz-ros2-control,
  robot-state-publisher,
  ros-gz-bridge,
  ros-gz-sim,
  ros2launch,
  xacro,

  # checkInputs
  ament-cmake-copyright,
  ament-cmake-cppcheck,
  ament-cmake-cpplint,
  ament-cmake-flake8,
  ament-cmake-gtest,
  ament-cmake-lint-cmake,
  ament-cmake-pep257,
  ament-cmake-uncrustify,
  ament-cmake-xmllint,
  ament-lint-auto,
  ament-lint-common,
  launch-testing-ament-cmake,
  rclcpp,
  sensor-msgs,
  xmllintPackageHook,

  # nativeCheckInputs
  ament-copyright,
  ament-cppcheck,
  ament-cpplint,
  ament-flake8,
  ament-lint-cmake,
  ament-pep257,
  ament-uncrustify,
  ament-xmllint,
  writableTmpDirAsHomeHook,
}:
buildRosPackage rec {
  pname = "ros-jazzy-motkin-dual-motor-testbed-gazebo";
  version = "1.1.0";

  src = fetchFromGitHub {
    owner = "Gepetto";
    repo = "motkin-dual-motor-testbed-robot";
    tag = "v${version}";
    hash = "sha256-xSp2/KlOReis2AaLKqJjMEd/7BfmfrGBFG3HfobqBqM=";
  };
  sourceRoot = "source/motkin_dual_motor_testbed_gazebo";

  __structuredAttrs = true;
  strictDeps = true;

  buildType = "ament_cmake";

  nativeBuildInputs = [
    ament-cmake
    rosdoc2
  ];
  buildInputs = [
    ament-cmake
    ament-cmake-auto
    gz-plugin-vendor
    gz-sim-vendor
  ];
  propagatedBuildInputs = [
    controller-manager
    gz-plugin-vendor
    joint-state-broadcaster
    launch
    launch-param-builder
    launch-ros
    motkin-dual-motor-testbed-description
    motkin-forward-command-controller
    motkin-gz-ros2-control
    robot-state-publisher
    ros-gz-bridge
    ros-gz-sim
    ros2launch
    xacro
  ];
  checkInputs = [
    ament-cmake-gtest
    ament-cmake-xmllint
    ament-lint-auto
    ament-lint-common
    launch-testing-ament-cmake
    rclcpp
    sensor-msgs
    ament-cmake-copyright
    ament-cmake-cppcheck
    ament-cmake-cpplint
    ament-cmake-flake8
    ament-cmake-lint-cmake
    ament-cmake-pep257
    ament-cmake-uncrustify
    ament-cmake-xmllint
    xmllintPackageHook
  ];
  nativeCheckInputs = [
    ament-copyright
    ament-cppcheck
    ament-cpplint
    ament-flake8
    ament-lint-cmake
    ament-pep257
    ament-uncrustify
    ament-xmllint
    writableTmpDirAsHomeHook
  ];

  doCheck = true;

  meta = {
    description = "Package starting the MOTKIN dual motor testbed robot in Gazebo";
    license = with lib.licenses; [ asl20 ];
    homepage = "https://github.com/Gepetto/motkin-dual-motor-testbed-robot";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}
