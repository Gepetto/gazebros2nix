{
  lib,
  buildRosPackage,
  fetchFromGitHub,

  # nativeBuildInputs
  ament-cmake,
  ament-cmake-gen-version-h,
  ament-cmake-python,

  # buildInputs
  backward-ros,
  controller-interface,
  controller-manager-msgs,
  diagnostic-updater,
  fmt,
  generate-parameter-library,
  hardware-interface,
  libstatistics-collector,
  lifecycle-msgs,
  pluginlib,
  rclcpp,
  realtime-tools,
  ros2-control-cmake,
  std-msgs,

  # propagatedBuildInputs
  launch,
  launch-ros,
  launch-testing-ros,
  python3Packages,
  rcl-interfaces,
  rclpy,
  ros2param,
  sensor-msgs,

  # checkInputs
  ament-cmake-gmock,
  ament-cmake-pytest,
  diagnostic-msgs,
  example-interfaces,
  hardware-interface-testing,
  launch-testing,
  robot-state-publisher,
  ros2-control-test-assets,
  ros2pkg,

  # nativeCheckInputs
  writableTmpDirAsHomeHook,
}:
buildRosPackage rec {
  pname = "ros-alum-controller-manager";
  version = "4.46.0";

  src = fetchFromGitHub {
    owner = "ros-controls";
    repo = "ros2_control";
    tag = version;
    hash = "sha256-e0Y8CCl8/B80fLOXOePbjn1QRxFEi60W2IGTBhM2Qg4=";
  };
  sourceRoot = "source/controller_manager";

  __structuredAttrs = true;
  strictDeps = true;

  buildType = "ament_cmake";

  nativeBuildInputs = [
    ament-cmake
    ament-cmake-gen-version-h
    ament-cmake-python
    generate-parameter-library
  ];
  buildInputs = [
    ament-cmake
    ament-cmake-gen-version-h
    ament-cmake-python
    backward-ros
    controller-interface
    controller-manager-msgs
    diagnostic-updater
    fmt
    generate-parameter-library
    hardware-interface
    libstatistics-collector
    lifecycle-msgs
    pluginlib
    rclcpp
    realtime-tools
    ros2-control-cmake
    std-msgs
  ];
  propagatedBuildInputs = [
    backward-ros
    controller-interface
    controller-manager-msgs
    diagnostic-updater
    fmt
    generate-parameter-library
    hardware-interface
    launch
    launch-ros
    launch-testing-ros
    libstatistics-collector
    lifecycle-msgs
    pluginlib
    python3Packages.filelock
    python3Packages.pyyaml
    rcl-interfaces
    rclcpp
    rclpy
    realtime-tools
    ros2param
    sensor-msgs
    std-msgs
  ];
  checkInputs = [
    ament-cmake-gmock
    ament-cmake-pytest
    diagnostic-msgs
    example-interfaces
    hardware-interface-testing
    launch-testing
    python3Packages.coverage
    robot-state-publisher
    ros2-control-test-assets
    ros2pkg
  ];
  nativeCheckInputs = [
    writableTmpDirAsHomeHook
  ];

  doCheck = false;

  meta = {
    description = "The main runnable entrypoint of ros2_control and home of controller management and resource management.";
    license = with lib.licenses; [ asl20 ];
    homepage = "https://github.com/ros-controls/ros2_control";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}
