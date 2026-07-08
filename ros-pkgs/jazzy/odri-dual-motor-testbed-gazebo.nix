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
  joint-state-broadcaster,
  launch,
  launch-param-builder,
  launch-ros,
  odri-dual-motor-testbed-description,
  odri-gz-ros2-control,
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
}:
buildRosPackage rec {
  pname = "ros-jazzy-odri-dual-motor-testbed-gazebo";
  version = "1.0.0";

  src = fetchFromGitHub {
    owner = "stack-of-tasks";
    repo = "odri_dual_motor_testbed_robot";
    rev = "a3aab82561117ddd5fe4f90747e8f43803c3b38a";
    hash = "sha256-MRsDFCSpclK6rxRiRe5rHZ/u+cpeNJWhiolsWiMIEAo=";
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
    joint-state-broadcaster
    launch
    launch-param-builder
    launch-ros
    odri-dual-motor-testbed-description
    odri-gz-ros2-control
    ros-gz-bridge
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
