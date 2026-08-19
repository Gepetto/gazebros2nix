{
  lib,
  buildRosPackage,
  fetchFromGitHub,

  # nativeBuildInputs
  ament-cmake,
  ament-cmake-python,
  pkg-config,

  # buildInputs
  ament-index-python,
  builtin-interfaces,
  cli11,
  geometry-msgs,
  gflags,
  gz-math-vendor,
  gz-msgs-vendor,
  gz-sim-vendor,
  gz-transport-vendor,
  launch,
  launch-ros,
  rclcpp,
  rclcpp-action,
  rclcpp-components,
  rcpputils,
  ros-gz-interfaces,
  ros2pkg,
  simulation-interfaces,
  std-msgs,
  tf2,
  tf2-ros,

  # propagatedBuildInputs

  # checkInputs
  ament-cmake-copyright,
  ament-cmake-cppcheck,
  ament-cmake-cpplint,
  ament-cmake-flake8,
  ament-cmake-lint-cmake,
  ament-cmake-pep257,
  ament-cmake-uncrustify,
  ament-cmake-xmllint,
  ament-lint-auto,
  ament-lint-common,
  launch-testing,
  launch-testing-ament-cmake,
  ros-gz-bridge,
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
  pname = "ros-alum-ros-gz-sim";
  version = "1.0.23";

  src = fetchFromGitHub {
    owner = "gazebosim";
    repo = "ros_gz";
    tag = version;
    hash = "sha256-hliXefmoiD/RU/MXyEIQo4XulT7I4NBu+QxOPjkSni0=";
  };
  sourceRoot = "source/ros_gz_sim";

  __structuredAttrs = true;
  strictDeps = true;

  buildType = "ament_cmake";

  nativeBuildInputs = [
    ament-cmake
    ament-cmake-python
    pkg-config
  ];
  buildInputs = [
    ament-cmake
    ament-cmake-python
    ament-index-python
    builtin-interfaces
    cli11
    geometry-msgs
    gflags
    gz-math-vendor
    gz-msgs-vendor
    gz-sim-vendor
    gz-transport-vendor
    launch
    launch-ros
    rclcpp
    rclcpp-action
    rclcpp-components
    rcpputils
    ros-gz-interfaces
    ros2pkg
    simulation-interfaces
    std-msgs
    tf2
    tf2-ros
  ];
  propagatedBuildInputs = [
    ament-index-python
    builtin-interfaces
    cli11
    geometry-msgs
    gflags
    gz-math-vendor
    gz-msgs-vendor
    gz-sim-vendor
    gz-transport-vendor
    launch
    launch-ros
    rclcpp
    rclcpp-action
    rclcpp-components
    rcpputils
    ros-gz-interfaces
    ros2pkg
    simulation-interfaces
    std-msgs
    tf2
    tf2-ros
  ];
  checkInputs = [
    ament-lint-auto
    ament-lint-common
    launch-testing
    launch-testing-ament-cmake
    ros-gz-bridge
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
    description = "Tools for using Gazebo Sim simulation with ROS.";
    license = with lib.licenses; [ asl20 ];
    homepage = "https://github.com/gazebosim/ros_gz";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}
