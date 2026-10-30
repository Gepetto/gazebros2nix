{
  lib,
  buildRosPackage,
  fetchFromGitHub,

  # nativeBuildInputs
  ament-cmake,
  ament-cmake-gen-version-h,

  # buildInputs
  backward-ros,
  control-msgs,
  fmt,
  joint-limits,
  libstatistics-collector,
  lifecycle-msgs,
  pal-statistics,
  pluginlib,
  rclcpp,
  rclcpp-lifecycle,
  rcpputils,
  rcutils,
  realtime-tools,
  ros2-control-cmake,
  tinyxml-2,
  urdf,

  # propagatedBuildInputs
  sdformat-urdf,

  # checkInputs
  ament-cmake-gmock,
  ros2-control-test-assets,

  # nativeCheckInputs
  writableTmpDirAsHomeHook,
}:
buildRosPackage rec {
  pname = "ros-alum-hardware-interface";
  version = "4.49.0";

  src = fetchFromGitHub {
    owner = "ros-controls";
    repo = "ros2_control";
    tag = version;
    hash = "sha256-wb3s95kNsBvMB3eT1NeuUEnjg612k13nkC4BqZ1h7K4=";
  };
  sourceRoot = "source/hardware_interface";

  __structuredAttrs = true;
  strictDeps = true;

  buildType = "ament_cmake";

  nativeBuildInputs = [
    ament-cmake
    ament-cmake-gen-version-h
  ];
  buildInputs = [
    ament-cmake
    ament-cmake-gen-version-h
    backward-ros
    control-msgs
    fmt
    joint-limits
    libstatistics-collector
    lifecycle-msgs
    pal-statistics
    pluginlib
    rclcpp
    rclcpp-lifecycle
    rcpputils
    rcutils
    realtime-tools
    ros2-control-cmake
    tinyxml-2
    urdf
  ];
  propagatedBuildInputs = [
    backward-ros
    control-msgs
    fmt
    joint-limits
    libstatistics-collector
    lifecycle-msgs
    pal-statistics
    pluginlib
    rclcpp
    rclcpp-lifecycle
    rcpputils
    rcutils
    realtime-tools
    sdformat-urdf
    tinyxml-2
    urdf
  ];
  checkInputs = [
    ament-cmake-gmock
    ros2-control-test-assets
  ];
  nativeCheckInputs = [
    writableTmpDirAsHomeHook
  ];

  doCheck = false;

  meta = {
    description = "Base classes for hardware abstraction and tooling for them";
    license = with lib.licenses; [ asl20 ];
    homepage = "https://github.com/ros-controls/ros2_control";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}
