{
  lib,
  buildRosPackage,
  fetchFromGitHub,

  # nativeBuildInputs
  ament-cmake,
  ament-cmake-python,
  pkg-config,
  rosidl-pycommon,

  # buildInputs
  actuator-msgs,
  geometry-msgs,
  gps-msgs,
  gz-msgs-vendor,
  gz-transport-vendor,
  launch,
  launch-ros,
  marine-acoustic-msgs,
  nav-msgs,
  rclcpp,
  rclcpp-components,
  ros-gz-interfaces,
  rosgraph-msgs,
  sensor-msgs,
  std-msgs,
  tf2-msgs,
  trajectory-msgs,
  vision-msgs,
  yaml-cpp-vendor,

  # propagatedBuildInputs

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
  launch-testing,
  launch-testing-ament-cmake,
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
  pname = "ros-alum-ros-gz-bridge";
  version = "1.0.23";

  src = fetchFromGitHub {
    owner = "gazebosim";
    repo = "ros_gz";
    tag = version;
    hash = "sha256-hliXefmoiD/RU/MXyEIQo4XulT7I4NBu+QxOPjkSni0=";
  };
  sourceRoot = "source/ros_gz_bridge";

  __structuredAttrs = true;
  strictDeps = true;

  buildType = "ament_cmake";

  nativeBuildInputs = [
    ament-cmake
    ament-cmake-python
    pkg-config
    rosidl-pycommon
  ];
  buildInputs = [
    actuator-msgs
    ament-cmake
    ament-cmake-python
    geometry-msgs
    gps-msgs
    gz-msgs-vendor
    gz-transport-vendor
    launch
    launch-ros
    marine-acoustic-msgs
    nav-msgs
    rclcpp
    rclcpp-components
    ros-gz-interfaces
    rosgraph-msgs
    sensor-msgs
    std-msgs
    tf2-msgs
    trajectory-msgs
    vision-msgs
    yaml-cpp-vendor
  ];
  propagatedBuildInputs = [
    actuator-msgs
    geometry-msgs
    gps-msgs
    gz-msgs-vendor
    gz-transport-vendor
    launch
    launch-ros
    marine-acoustic-msgs
    nav-msgs
    rclcpp
    rclcpp-components
    ros-gz-interfaces
    rosgraph-msgs
    sensor-msgs
    std-msgs
    tf2-msgs
    trajectory-msgs
    vision-msgs
    yaml-cpp-vendor
  ];
  checkInputs = [
    ament-cmake-gtest
    ament-lint-auto
    ament-lint-common
    launch-testing
    launch-testing-ament-cmake
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
    description = "Bridge communication between ROS and Gazebo Transport";
    license = with lib.licenses; [ asl20 ];
    homepage = "https://github.com/gazebosim/ros_gz";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}
