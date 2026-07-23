{
  lib,
  buildRosPackage,
  fetchFromGitHub,

  # nativeBuildInputs
  ament-cmake,

  # buildInputs
  backward-ros,
  controller-interface,
  filters,
  generate-parameter-library,
  geometry-msgs,
  hardware-interface,
  pluginlib,
  rclcpp,
  rclcpp-lifecycle,
  realtime-tools,
  ros2-control-cmake,
  tf2,
  tf2-geometry-msgs,
  tf2-ros,

  # propagatedBuildInputs

  # checkInputs
  ament-cmake-gmock,
  controller-manager,
  hardware-interface-testing,
  ros2-control-test-assets,

  # nativeCheckInputs
  writableTmpDirAsHomeHook,
}:
buildRosPackage rec {
  pname = "ros-alum-force-torque-sensor-broadcaster";
  version = "4.41.0";

  src = fetchFromGitHub {
    owner = "ros-controls";
    repo = "ros2_controllers";
    tag = version;
    hash = "sha256-+JDFzCLyZ3UAC/DTd/LBVLf+OnrDvzaFcZaxHTFwbr4=";
  };
  sourceRoot = "source/force_torque_sensor_broadcaster";

  __structuredAttrs = true;
  strictDeps = true;

  buildType = "ament_cmake";

  nativeBuildInputs = [
    ament-cmake
    generate-parameter-library
  ];
  buildInputs = [
    ament-cmake
    backward-ros
    controller-interface
    filters
    generate-parameter-library
    geometry-msgs
    hardware-interface
    pluginlib
    rclcpp
    rclcpp-lifecycle
    realtime-tools
    ros2-control-cmake
    tf2
    tf2-geometry-msgs
    tf2-ros
  ];
  propagatedBuildInputs = [
    backward-ros
    controller-interface
    filters
    generate-parameter-library
    geometry-msgs
    hardware-interface
    pluginlib
    rclcpp
    rclcpp-lifecycle
    realtime-tools
    tf2
    tf2-geometry-msgs
    tf2-ros
  ];
  checkInputs = [
    ament-cmake-gmock
    controller-manager
    hardware-interface-testing
    ros2-control-test-assets
  ];
  nativeCheckInputs = [
    writableTmpDirAsHomeHook
  ];

  doCheck = true;

  meta = {
    description = "Controller to publish state of force-torque sensors.";
    license = with lib.licenses; [ asl20 ];
    homepage = "https://github.com/ros-controls/ros2_controllers";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}
