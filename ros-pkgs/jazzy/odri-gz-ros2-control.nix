{
  lib,
  buildRosPackage,
  fetchFromGitHub,

  # nativeBuildInputs
  ament-cmake,

  # buildInputs
  controller-manager,
  gz-plugin-vendor,
  gz-sim-vendor,
  hardware-interface,
  pluginlib,
  rclcpp,
  rclcpp-lifecycle,
  ros2-control-cmake,
  yaml-cpp-vendor,

  # propagatedBuildInputs

  # checkInputs
  ament-cmake-copyright,
  ament-cmake-cppcheck,
  ament-cmake-cpplint,
  ament-cmake-gtest,
  ament-cmake-lint-cmake,
  ament-cmake-xmllint,
  ament-lint-auto,
  ament-lint-common,
  xmllintPackageHook,

  # nativeCheckInputs
  ament-copyright,
  ament-cppcheck,
  ament-cpplint,
  ament-lint-cmake,
  ament-xmllint,
}:
buildRosPackage rec {
  pname = "ros-jazzy-odri-gz-ros2-control";
  version = "1.2.2";

  src = fetchFromGitHub {
    owner = "stack-of-tasks";
    repo = "odri_gz_ros2_control";
    rev = "25575c5976013a909e0e8dd365ef441c419bcb45";
    hash = "sha256-MIA/ZKyvOShXrqgWknjxtTnNsEjpN4cDl13gEeiPfgE=";
  };
  sourceRoot = "source/";

  __structuredAttrs = true;
  strictDeps = true;

  buildType = "ament_cmake";

  nativeBuildInputs = [
    ament-cmake
  ];
  buildInputs = [
    ament-cmake
    controller-manager
    gz-plugin-vendor
    gz-sim-vendor
    hardware-interface
    pluginlib
    rclcpp
    rclcpp-lifecycle
    ros2-control-cmake
    yaml-cpp-vendor
  ];
  propagatedBuildInputs = [
    controller-manager
    gz-plugin-vendor
    gz-sim-vendor
    hardware-interface
    pluginlib
    rclcpp
    rclcpp-lifecycle
    ros2-control-cmake
    yaml-cpp-vendor
  ];
  checkInputs = [
    ament-cmake-copyright
    ament-cmake-cppcheck
    ament-cmake-cpplint
    ament-cmake-gtest
    ament-cmake-lint-cmake
    ament-cmake-xmllint
    ament-lint-auto
    ament-lint-common
    xmllintPackageHook
  ];
  nativeCheckInputs = [
    ament-copyright
    ament-cppcheck
    ament-cpplint
    ament-lint-cmake
    ament-xmllint
  ];

  doCheck = true;

  meta = {
    description = "Gazebo ros2_control package allows to control simulated robots using ros2_control framework (ODRI fork).";
    license = with lib.licenses; [ asl20 ];
    homepage = "https://github.com/stack-of-tasks/odri_gz_ros2_control";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}
