{
  lib,
  buildRosPackage,
  fetchFromGitHub,

  # nativeBuildInputs
  ament-cmake,
  writableTmpDirAsHomeHook,

  # buildInputs
  controller-interface,
  generate-parameter-library,
  hardware-interface,
  pluginlib,
  rclcpp,
  rclcpp-lifecycle,
  realtime-tools,
  std-msgs,

  # propagatedBuildInputs

  # checkInputs
  ament-cmake-gmock,
  ament-lint-auto,
  ament-lint-common,

  # nativeCheckInputs
}:
buildRosPackage rec {
  pname = "ros-jazzy-odri-forward-command-controller";
  version = "0.1.0";

  src = fetchFromGitHub {
    owner = "stack-of-tasks";
    repo = "odri_forward_command_controller";
    rev = "791ff09a36d15c6f435650ef1685de0c801ca922";
    hash = "sha256-vEpNhyLrKJx0F3gn6JAhpPfFXrFEbZKSoSraoMcrrAA=";
  };
  sourceRoot = "source/";

  __structuredAttrs = true;
  strictDeps = true;

  buildType = "ament_cmake";

  nativeBuildInputs = [
    ament-cmake
    generate-parameter-library
    writableTmpDirAsHomeHook
  ];
  buildInputs = [
    ament-cmake
    controller-interface
    generate-parameter-library
    hardware-interface
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
    pluginlib
    rclcpp
    rclcpp-lifecycle
    realtime-tools
    std-msgs
  ];
  checkInputs = [
    ament-cmake-gmock
    ament-lint-auto
    ament-lint-common
  ];
  nativeCheckInputs = [
  ];

  doCheck = true;

  meta = {
    description = "Forward command controller for ODRI joints that sends position, velocity,
    effort, gain_kp and gain_kd commands together via a single topic using
    std_msgs/Float64MultiArray. The flat data array is ordered as:
    [pos×n | vel×n | eff×n | gain_kp×n | gain_kd×n] for n joints.
    Per-value NaN entries are silently skipped for partial updates.";
    license = with lib.licenses; [ asl20 ];
    homepage = "https://github.com/stack-of-tasks/odri_forward_command_controller";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}
