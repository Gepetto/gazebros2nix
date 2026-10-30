{
  lib,
  buildRosPackage,
  fetchFromGitHub,

  # nativeBuildInputs
  ament-cmake,

  # buildInputs
  hardware-interface,
  lifecycle-msgs,
  pluginlib,
  rclcpp,
  rclcpp-lifecycle,
  ros2-control-cmake,
  ros2-control-test-assets,

  # propagatedBuildInputs

  # checkInputs
  ament-cmake-gmock,

  # nativeCheckInputs
  writableTmpDirAsHomeHook,
}:
buildRosPackage rec {
  pname = "ros-alum-hardware-interface-testing";
  version = "4.49.0";

  src = fetchFromGitHub {
    owner = "ros-controls";
    repo = "ros2_control";
    tag = version;
    hash = "sha256-wb3s95kNsBvMB3eT1NeuUEnjg612k13nkC4BqZ1h7K4=";
  };
  sourceRoot = "source/hardware_interface_testing";

  __structuredAttrs = true;
  strictDeps = true;

  buildType = "ament_cmake";

  nativeBuildInputs = [
    ament-cmake
  ];
  buildInputs = [
    ament-cmake
    hardware-interface
    lifecycle-msgs
    pluginlib
    rclcpp
    rclcpp-lifecycle
    ros2-control-cmake
    ros2-control-test-assets
  ];
  propagatedBuildInputs = [
    hardware-interface
    lifecycle-msgs
    pluginlib
    rclcpp
    rclcpp-lifecycle
    ros2-control-test-assets
  ];
  checkInputs = [
    ament-cmake-gmock
  ];
  nativeCheckInputs = [
    writableTmpDirAsHomeHook
  ];

  doCheck = false;

  meta = {
    description = "Commonly used test fixtures for the ros2_control framework";
    license = with lib.licenses; [ asl20 ];
    homepage = "https://github.com/ros-controls/ros2_control";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}
