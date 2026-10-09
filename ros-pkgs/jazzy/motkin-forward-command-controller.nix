{
  lib,
  buildRosPackage,
  fetchFromGitHub,

  # nativeBuildInputs
  ament-cmake,

  # buildInputs
  controller-interface,
  generate-parameter-library,
  hardware-interface,
  motkin-dual-motor-testbed-msgs,
  pluginlib,
  rclcpp,
  rclcpp-lifecycle,
  realtime-tools,
  std-msgs,

  # propagatedBuildInputs
  rclpy,

  # checkInputs
  ament-cmake-copyright,
  ament-cmake-cppcheck,
  ament-cmake-cpplint,
  ament-cmake-flake8,
  ament-cmake-gmock,
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
  pname = "ros-jazzy-motkin-forward-command-controller";
  version = "1.1.0";

  src = fetchFromGitHub {
    owner = "Gepetto";
    repo = "motkin-dual-motor-testbed-robot";
    tag = "v${version}";
    hash = "sha256-xSp2/KlOReis2AaLKqJjMEd/7BfmfrGBFG3HfobqBqM=";
  };
  sourceRoot = "source/motkin_dual_motor_testbed_controllers/motkin_forward_command_controller";

  __structuredAttrs = true;
  strictDeps = true;

  buildType = "ament_cmake";

  nativeBuildInputs = [
    ament-cmake
    generate-parameter-library
  ];
  buildInputs = [
    ament-cmake
    controller-interface
    generate-parameter-library
    hardware-interface
    motkin-dual-motor-testbed-msgs
    pluginlib
    rclcpp
    rclcpp-lifecycle
    realtime-tools
    std-msgs
  ];
  propagatedBuildInputs = [
    controller-interface
    generate-parameter-library
    hardware-interface
    motkin-dual-motor-testbed-msgs
    pluginlib
    rclcpp
    rclcpp-lifecycle
    rclpy
    realtime-tools
    std-msgs
  ];
  checkInputs = [
    ament-cmake-gmock
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
    description = "Forward command controller for MOTKIN joints that sends position, velocity, effort, gain_kp and gain_kd commands together via a single topic using std_msgs/Float64MultiArray. The flat data array is ordered as: [pos×n | vel×n | eff×n | gain_kp×n | gain_kd×n] for n joints. Per-value NaN entries are silently skipped for partial updates.";
    license = with lib.licenses; [ asl20 ];
    homepage = "https://github.com/Gepetto/motkin-dual-motor-testbed-robot";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}
