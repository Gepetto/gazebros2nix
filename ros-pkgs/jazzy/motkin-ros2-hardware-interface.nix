{
  lib,
  buildRosPackage,
  fetchFromGitHub,

  # nativeBuildInputs
  ament-cmake,

  # buildInputs
  hardware-interface,
  pluginlib,
  rclcpp,
  rclcpp-lifecycle,
  ros2-control-cmake,

  # propagatedBuildInputs
  controller-manager,
  joint-state-broadcaster,
  motkin-forward-command-controller,
  robot-state-publisher,
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
  pname = "ros-jazzy-motkin-ros2-hardware-interface";
  version = "1.1.0";

  src = fetchFromGitHub {
    owner = "Gepetto";
    repo = "motkin-ros2-hardware-interface";
    tag = "v${version}";
    hash = "sha256-LPBfkcxmvZhqrpqSs6B26/6BYtJopFZkAPTBKGKcHdE=";
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
    hardware-interface
    pluginlib
    rclcpp
    rclcpp-lifecycle
    ros2-control-cmake
  ];
  propagatedBuildInputs = [
    controller-manager
    hardware-interface
    joint-state-broadcaster
    motkin-forward-command-controller
    pluginlib
    rclcpp
    rclcpp-lifecycle
    robot-state-publisher
    ros2-control-cmake
    xacro
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
    description = "ros2_control SystemInterface hardware plugin that drives a dual-motor
    testbed through the Raspberry Pi Pico USB-CDC binary protocol implemented
    by motkin (dual BUG79100G encoder + DRV8316C driver board).";
    license = with lib.licenses; [ asl20 ];
    homepage = "https://github.com/Gepetto/motkin-ros2-hardware-interface";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}
